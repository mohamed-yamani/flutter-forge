import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterforge/data/models/result_model.dart';
import 'package:flutterforge/domain/entities/app_error.dart';
import 'package:flutterforge/domain/entities/no_params.dart';
import 'package:flutterforge/domain/usecases/get_breeds_use_case.dart';
import 'package:flutterforge/presentation/blocs/loading_bloc/loading_bloc.dart';

part 'get_breeds_event.dart';
part 'get_breeds_state.dart';

class GetBreedsBloc extends Bloc<GetBreedsEvent, GetBreedsState> {
  GetBreedsUseCase getBreedsUseCase;
  // loadingBloc
  LoadingBloc loadingBloc;

  GetBreedsBloc({
    required this.getBreedsUseCase,
    required this.loadingBloc,
  }) : super(GetBreedsInitial()) {
    on<GetBreedsEvent>((event, emit) {});

    on<GetBreeds>((event, emit) async {
      emit(GetBreedsLoading());
      loadingBloc.add(ShowLoading());
      final result = await getBreedsUseCase(NoParams());
      await Future.delayed(const Duration(seconds: 10));
      loadingBloc.add(HideLoading());
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
