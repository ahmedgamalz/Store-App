import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/helper/api.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () async {
              http.Response response = await http
                  .post(Uri.parse('https://fakestoreapi.com/products'), body: {
                'title': 'test product',
                'price': '13.5',
                'description': 'lorem ipsum set',
                'image': ' https://i.pravatar.cc',
                'category': 'electronic',
              }, headers: {
                'Content-Type': 'multipart/form-data; boundary',
                'Accept': 'application/json'
              });
            },
            child: Container()),
      ),
    );
  }
}
