part of 'get_breeds_bloc.dart';

abstract class GetBreedsEvent extends Equatable {
  const GetBreedsEvent();

  @override
  List<Object> get props => [];
}

class GetBreeds extends GetBreedsEvent {}

class GetBreedsBySearch extends GetBreedsEvent {
  final String search;

  const GetBreedsBySearch(this.search);

  @override
  List<Object> get props => [search];
}
