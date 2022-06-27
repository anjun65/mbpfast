part of 'models.dart';


class BannerModel extends Equatable {
  int id;
  int is_show;
  String photos;

  BannerModel(
      {this.id, this.is_show, this.photos,});

  factory BannerModel.fromJson(Map<String, dynamic> data) => BannerModel(
    id: data['id'],
    is_show: data['is_show'],
    photos: data['photos'],
  );

  @override
  List<Object> get props =>
      [id, is_show, photos];
}