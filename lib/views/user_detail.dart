import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fetch/models/user.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({Key key}) : super(key: key);

  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  getUserDetail(userId) async {
    var response = await http
        .get(Uri.https('jsonplaceholder.typicode.com', 'users/${userId}'));
    var jsonData = jsonDecode(response.body);
    User user = User(jsonData['name'], jsonData['email'], jsonData['username'],
        jsonData['phone'], jsonData['website']);
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
          future: getUserDetail(1),
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
                  child:Column(
                    children: [
                      Text(snapshot.data.name),                    ],
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
