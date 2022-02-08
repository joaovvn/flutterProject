// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project1/controllers/home_controller.dart';
import 'package:project1/models/post_model.dart';
import 'package:project1/repositories/home_repository_imp.dart';
import 'package:project1/services/prefs_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(HomeRepositoryImp());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Home'),
        ),
        actions: [
          IconButton(
              onPressed: () {
                PrefsService.logout();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/login', (route) => false);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: ValueListenableBuilder<List<PostModel>>(
          valueListenable: _controller.posts,
          builder: (_, list, __) {
            return ListView.separated(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (_, index) => ListTile(
                leading: Text(list[index].id.toString()),
                title: Text(list[index].title),
                trailing: Icon(Icons.arrow_forward),
                onTap: () => Navigator.of(context)
                    .pushNamed('/details', arguments: list[index]),
              ),
              separatorBuilder: (_, __) => Divider(),
            );
          }),
    );
  }
}
