part of 'region_cubit.dart';

abstract class RegionState extends Equatable {
  const RegionState();

  @override
  List<Object> get props => [];
}

class RegionInitial extends RegionState {}

class RegionLoaded extends RegionState {
  final List<Region> regions;

  RegionLoaded(this.regions);

  @override
  List<Object> get props => [regions];
}

class RegionLoadingFailed extends RegionState {
  final String message;

  RegionLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}