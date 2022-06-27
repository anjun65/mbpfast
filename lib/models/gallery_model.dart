part of 'models.dart';

class GalleryModel {
  int id;
  int productsId;
  String photos;

  GalleryModel({
    this.id,
    this.productsId,
    this.photos,
  });

  GalleryModel.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    productsId = data['products_id'];
    photos = data['photos'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'products_id': productsId,
      'photos': photos,
    };
  }
}
