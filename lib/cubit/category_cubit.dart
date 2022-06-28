import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mbpfast/models/models.dart';
import 'package:mbpfast/services/services.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  Future<void> getBanners() async {
    ApiReturnValue<List<Category>> result = await CategoryServices.getCategories();

    print(result);
    if (result.value != null) {
      emit(CategoryLoaded(result.value));
    } else {
      emit(CategoryLoadingFailed(result.message));
    }
  }
}


