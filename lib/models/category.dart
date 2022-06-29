part of 'models.dart';

class Category extends Equatable {
  int id;
  String name;
  String photo;
  String slug;
  
  Category(
      {this.id, this.name, this.photo, this.slug});

  factory Category.fromJson(Map<String, dynamic> data) => Category(
    id: data['id'],
    name: data['name'],
    photo: data['photo'],
    slug: data['slug'],
  );

  @override
  List<Object> get props =>
      [id, name, photo, slug];
}