import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mbpfast/models/models.dart';
import 'package:mbpfast/services/services.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit() : super(BannerInitial());

  Future<void> getBanners() async {
    ApiReturnValue<List<BannerModel>> result = await BannerServices.getBanners();

    print(result);
    if (result.value != null) {
      emit(BannerLoaded(result.value));
    } else {
      emit(BannerLoadingFailed(result.message));
    }
  }
}


