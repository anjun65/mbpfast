part of 'models.dart';


class BannerModel extends Equatable {
  final int id;
  final int is_show;
  final String photos;

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

List<BannerModel> mockBanner = [
  BannerModel(
      id: 1,
      photos:
      "https://i.pinimg.com/736x/06/7b/28/067b2879e5c9c42ec669bf639c3fbffc.jpg",
      is_show: 1,
)];
