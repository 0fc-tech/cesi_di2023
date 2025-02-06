class Product {
  final int id = 0;
  final String title;
  final String description;
  final String category;
  final String image;
  final num price;

  Product({
    required this.title,
    required this.description,
    required this.category,
    required this.image,
    required this.price,
  });

  String priceEuro() => "$price€";

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'description': this.description,
      'category': this.category,
      'image': this.image,
      'price': this.price,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      title: map['title'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      image: map['image'] as String,
      price: map['price'] as num,
    );
  }
}
