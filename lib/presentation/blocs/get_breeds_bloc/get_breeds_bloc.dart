import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterforge/data/models/result_model.dart';
import 'package:flutterforge/domain/entities/app_error.dart';
import 'package:flutterforge/domain/entities/no_params.dart';
import 'package:flutterforge/domain/usecases/get_breeds_use_case.dart';

part 'get_breeds_event.dart';
part 'get_breeds_state.dart';

class GetBreedsBloc extends Bloc<GetBreedsEvent, GetBreedsState> {
  GetBreedsUseCase getBreedsUseCase;
  GetBreedsBloc({
    required this.getBreedsUseCase,
  }) : super(GetBreedsInitial()) {
    on<GetBreedsEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetBreeds>((event, emit) async {
      emit(GetBreedsLoading());
      final result = await getBreedsUseCase(NoParams());
      result.fold(
        (error) {
          print("bloc error: $error");
          emit(GetBreedsError(error: error));
        },
        (data) {
          print("bloc data: $data");
          emit(GetBreedsLoaded(breeds: data));
        },
      );
    });
  }
}
