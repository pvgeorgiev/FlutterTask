import 'package:flutter/material.dart';
import 'package:flutter_task/models/repository.dart';

class RepositoryInfo extends StatefulWidget {
  const RepositoryInfo({Key? key, required this.repo}) : super(key: key);

  final Repository repo;

  @override
  _RepositoryInfoState createState() => _RepositoryInfoState();
}

class _RepositoryInfoState extends State<RepositoryInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
