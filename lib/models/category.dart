part of 'models.dart';

class Category extends Equatable {
  int id;
  String name;
  String photos;
  String slug;
  
  Category(
      {this.id, this.name, this.photos, this.slug});

  factory Category.fromJson(Map<String, dynamic> data) => Category(
    id: data['id'],
    name: data['name'],
    photos: data['photos'],
    slug: data['slug'],
  );

  @override
  List<Object> get props =>
      [id, name, photos, slug];
}