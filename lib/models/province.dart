part of 'models.dart';

class Province extends Equatable {
  int id;
  String name;
  
  
  Province(
      {this.id, this.name});

  factory Province.fromJson(Map<String, dynamic> data) => Province(
    id: data['id'],
    name: data['name'],
  );

  @override
  List<Object> get props =>
      [id, name];
}