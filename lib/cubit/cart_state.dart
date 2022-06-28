part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoaded extends CartState {
  final List<Cart> carts;

  CartLoaded(this.carts);

  @override
  List<Object> get props => [carts];
}

class CartLoadingFailed extends CartState {
  final String message;

  CartLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}