part of 'get_breeds_bloc.dart';

abstract class GetBreedsState extends Equatable {
  const GetBreedsState();

  @override
  List<Object> get props => [];
}

class GetBreedsInitial extends GetBreedsState {}

class GetBreedsLoading extends GetBreedsState {}

class GetBreedsLoaded extends GetBreedsState {
  final List<BreedsData> breeds;

  const GetBreedsLoaded({required this.breeds});

  @override
  List<Object> get props => [breeds];
}

class GetBreedsError extends GetBreedsState {
  final AppError error;

  const GetBreedsError({required this.error});

  @override
  List<Object> get props => [error];
}
