import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fetch/models/user.dart';
import 'package:get/get.dart';

class UserDetail extends StatefulWidget {
  int id;
   UserDetail({this.id, Key key}) : super(key: key);

  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  getUserDetail(userId) async {
    var response = await http
        .get(Uri.https('jsonplaceholder.typicode.com', 'users/${userId}'));
    var jsonData = jsonDecode(response.body);
    User user = User(jsonData['id'], jsonData['name'], jsonData['email'],
        jsonData['username'], jsonData['phone'], jsonData['website']);
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Name'),
      ),
      body: Card(
        child: FutureBuilder(
          future: getUserDetail(widget.id),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text('loading'),
                ),
              );
            } else {
              return Container(
                child: Container(
                  child: Column(
                    children: [
                      Text('Name : ${snapshot.data.name}'),
                      Text('Username : ${snapshot.data.username}'),
                      Text('Email : ${snapshot.data.email}'),
                      Text('Phone : ${snapshot.data.phone}'),
                      Text('Website : ${snapshot.data.website}'),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
