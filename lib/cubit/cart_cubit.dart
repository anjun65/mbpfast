import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mbpfast/models/models.dart';
import 'package:mbpfast/services/services.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Future<void> getCarts() async {
    ApiReturnValue<List<Cart>> result = await CartServices.getCarts();

    if (result.value != null) {
      emit(CartLoaded(result.value));
    } else {
      emit(CartLoadingFailed(result.message));
    }
  }
}


