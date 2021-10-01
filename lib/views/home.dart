import 'package:fetch/views/users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fetch/views/user_detail.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  String id;
  final _formKey = GlobalKey<FormState>();
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
                  child: Text('Tüm Kullanıcıları çek')),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Kullanıcı ID",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Boş bırakma';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          id = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            Get.to(UserDetail(id: int.parse(id)));
                          }
                        },
                        child: const Text('Kullanıcıyı Göster'),
                      ),
                    ),
                  ],
                ),
              )

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
