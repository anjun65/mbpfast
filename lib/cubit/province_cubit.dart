import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mbpfast/models/models.dart';
import 'package:mbpfast/services/services.dart';

part 'province_state.dart';

class ProvinceCubit extends Cubit<ProvinceState> {
  ProvinceCubit() : super(ProvinceInitial());

  Future<void> getProvinces() async {
    ApiReturnValue<List<Province>> result = await ProvinceServices.getProvinces();

    if (result.value != null) {
      emit(ProvinceLoaded(result.value));
    } else {
      emit(ProvinceLoadingFailed(result.message));
    }
  }
}