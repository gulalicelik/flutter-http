import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fetch/models/user.dart';
import 'package:get/get.dart';
import 'package:fetch/views/user_detail.dart';

class DataFromApi extends StatefulWidget {
  const DataFromApi({Key key}) : super(key: key);

  @override
  _DataFromApiState createState() => _DataFromApiState();
}

class _DataFromApiState extends State<DataFromApi> {
  getUserData() async {
    var response =
        await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));
    var jsonData = jsonDecode(response.body);
    List<User> users = [];
    for (var u in jsonData) {
      User user =
          User(u['id'],u['name'], u['email'], u['username'], u['phone'], u['website']);
      users.add(user);
    }

    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('User Data From API'),
        ),
        body: Card(
          child: FutureBuilder(
            future: getUserData(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text('loading'),
                  ),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        title: Text(snapshot.data[i].name),
                        subtitle: Text(snapshot.data[i].email),
                        trailing: Icon(Icons.arrow_right_alt_outlined),
                        onTap: () {
                          Get.to(UserDetail(id: snapshot.data[i].id));
                        },
                      );
                    });
              }
            },
          ),
        ));
  }
}
