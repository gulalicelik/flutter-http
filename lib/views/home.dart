import 'package:fetch/views/users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fetch/views/user_detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ana Sayfa'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.to(DataFromApi());
                  },
                  child: Text('Tüm Kullanıcıları çek')
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     Get.to(UserDetail());
                //   },
                //   child: Text('ID\'ye göre kullanıcı çek')
                // ),
            ],
          ),
        ),
      ),
    );
  }
}
