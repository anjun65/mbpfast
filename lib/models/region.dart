part of 'models.dart';

class Region extends Equatable {
  int id;
  String name;
  
  
  Region(
      {this.id, this.name});

  factory Region.fromJson(Map<String, dynamic> data) => Region(
    id: data['id'],
    name: data['name'],
  );

  @override
  List<Object> get props =>
      [id, name];
}