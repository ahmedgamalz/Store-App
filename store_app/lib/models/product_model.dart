import 'package:flutter/foundation.dart';

class ProductModel {
  int id;
  String title;
  String price;
  String description;
  String category;
  String image;
  RatingModel rating;
  ProductModel(
      {required this.id,
      required this.title,
      required this.category,
      required this.image,
      required this.description,
      required this.price,
      required this.rating});

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      category: jsonData['category'],
      image: jsonData['image'],
      description: jsonData['description'],
      price: jsonData['price'],
      rating: RatingModel.fromJson(jsonData['rating']),
    );
  }
}

class RatingModel {
  double rate;
  int count;
  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromJson(jsonData) {
    return RatingModel(rate: jsonData['rate'], count: jsonData['count']);
  }
}
