part of 'models.dart';

enum FoodType { new_food, popular, recommended }

class Food extends Equatable {
  final int id;
  final String name;
  final int categories_id;
  final int price;
  final String description;
  final String photos;
  // final GalleryModel galleries;


  Food(
      { this.id,
        this.name,
        this.categories_id,
        this.price,
        this.description,
        this.photos,
        // this.galleries,
      });

  factory Food.fromJson(Map<String, dynamic> data) => Food(
      id: data['id'],
      name: data['name'],
      categories_id: data['categories_id'],
      price: data['price'],
      description: data['description'],
      photos: data['photos'],
      // galleries : GalleryModel.fromJson(data['id']),
  );

  @override
  List<Object> get props =>
      [id, name, categories_id, price, description, photos];
}
