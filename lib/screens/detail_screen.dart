import 'package:flutter/material.dart';

class FoodPlaceDetailScreen extends StatelessWidget {
  final String foodPlaceId;

  const FoodPlaceDetailScreen({Key? key, required this.foodPlaceId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Place Detail'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display food place details (name, description, location, reviews, etc.)
        ],
      ),
    );
  }
}
