part of 'models.dart';

class GalleryModel {
  int id;
  String photos;

  GalleryModel({
    this.id,
    this.photos,
  });

  GalleryModel.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    photos = data['photos'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'photos': photos,
    };
  }
}


