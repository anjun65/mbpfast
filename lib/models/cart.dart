part of 'models.dart';

class Cart extends Equatable {
  int id;
  int products_id;
  int users_id;
  int total;
  List<Food> foods;
  
  
  Cart(
      {this.id, this.products_id, this.users_id, this.total, this.foods});

  factory Cart.fromJson(Map<String, dynamic> data) => Cart(
    id: data['id'],
    products_id: data['products_id'],
    users_id: data['users_id'],
    total: data['total'],
    foods : List<Food>.from(data["product"].map((x) => Food.fromJson(x))),
  );

  @override
  List<Object> get props =>
      [id, products_id, users_id, total, foods];
}