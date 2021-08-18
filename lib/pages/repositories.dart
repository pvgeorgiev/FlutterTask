import 'package:flutter/material.dart';
import 'package:flutter_task/network/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_task/models/repository.dart';
import 'package:flutter_task/pages/repository_info.dart';

class Repositories extends StatefulWidget {
  const Repositories({Key? key}) : super(key: key);

  @override
  _RepositoriesState createState() => _RepositoriesState();
}

class _RepositoriesState extends State<Repositories> {

  List<Repository> repositories = [];

  void _getData() {
    final dio = Dio();
    dio.options.headers["accept"] = "application/vnd.github.v3+json";

    final client = RestClient(dio);
    client.getAllRepositories().then((value) {
      setState(() {
        repositories.clear();
        repositories.addAll(value);
      });
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  Widget _buildRow(int index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(repositories[index].owner.avatarUrl),
      ),
      title: Text(repositories[index].name ?? ''),
      subtitle: Text(repositories[index].fullName ?? ''),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => RepositoryInfo(repo: repositories[index])));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Git Repositories'),
        backgroundColor: Colors.blue[900],
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    maxLines: 1,
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(
                          color: Colors.amber
                        ),
                      ),
                      hintText: 'Search for repository',
                      labelText: 'Search',
                      suffix: Text('GIT')
                    ),
                  ),
                ),
                SizedBox(width: 15.0,),
                ElevatedButton.icon(
                  onPressed: () {},
                  label: Text('Search'),
                  icon: Icon(Icons.search),
                  style: ButtonStyle(
                    backgroundColor:
                      MaterialStateProperty.all(Colors.amber[400]),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                itemCount: repositories.length,
                itemBuilder: (context, index) => _buildRow(index),
              ),
          ),
        ],
      ),
    );
  }
}
