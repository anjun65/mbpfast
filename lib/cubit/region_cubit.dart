import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mbpfast/models/models.dart';
import 'package:mbpfast/services/services.dart';

part 'region_state.dart';

class RegionCubit extends Cubit<RegionState> {
  RegionCubit() : super(RegionInitial());

  Future<void> getRegions() async {
    ApiReturnValue<List<Region>> result = await RegionServices.getRegions();

    if (result.value != null) {
      emit(RegionLoaded(result.value));
    } else {
      emit(RegionLoadingFailed(result.message));
    }
  }
}