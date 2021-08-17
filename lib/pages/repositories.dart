import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_task/models/repository.dart';
import 'package:flutter_task/networking/rest_client.dart';

class Repositories extends StatefulWidget {
  const Repositories({Key? key}) : super(key: key);

  @override
  _RepositoriesState createState() => _RepositoriesState();
}

class _RepositoriesState extends State<Repositories> {
  List<Repository> repositories = [];

  void makeRequest() {
    final dio = Dio();
    dio.options.headers['accept'] = 'application/vnd.github.v3+json';
    final client = RestClient(dio);

    client
        .getRepositories()
        .then((value) => _refreshData(value))
        .catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          print("Got error ${res!.statusCode} -> ${res.statusMessage}");
          break;
        default:
          print("ERROR");
      }
    });
  }

  void _refreshData(List<Repository> repos) {
    setState(() {
      repositories.removeRange(0, repositories.length);
      repositories.addAll(repos);
    });
  }

  @override
  Widget build(BuildContext context) {
    makeRequest();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Git repositories'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Repositories'),
                  ),
                ),
                SizedBox(
                  width: 16.0,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  label: Text('Search repo'),
                  icon: Icon(Icons.search),
                ),
              ],
            ),
          ),
          Row(
            children: [
              ListView.builder(itemBuilder: (context, i) {
                return _buildRow(i);
              })
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRow(int index) {
    return ListTile(
      title: Text(
        'Id: ${repositories[index].id}; Name: Id: ${repositories[index].name}',
      ),
    );
  }
}
