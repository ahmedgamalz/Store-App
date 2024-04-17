import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/models/product_model.dart';

class AllProductsServices {
  Future<List<ProductModel>> GetAllProduct() async {
    http.Response response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<ProductModel> productList = [];
      for (int i = 0; i < data.length; i++) {
        productList.add(ProductModel.fromJson(data[i]));
      }
      return productList;
    } else {
      throw Exception(
          'There is a problem with status code ${response.statusCode}');
    }
  }
}
