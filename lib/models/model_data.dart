class FoodPlace {
  final String id;
  final String name;
  final String image;
  final String description;
  final String location;
  final double rating;
  final List<String> reviews;

  FoodPlace({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.location,
    required this.rating,
    required this.reviews,
  });
}
