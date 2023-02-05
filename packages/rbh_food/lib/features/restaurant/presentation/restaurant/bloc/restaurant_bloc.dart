import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rbh_food/features/restaurant/domain/usecases/get_restaurant_use_case.dart';
import 'package:rbh_food/features/restaurant/presentation/restaurant/bloc/restaurant_event.dart';
import 'package:rbh_food/features/restaurant/presentation/restaurant/bloc/restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RestaurantBloc(
    this._getRestaurantUseCase,
  ) : super(Initial()) {
    on<LoadDataEvent>((event, emit) async {
      emit(Loading());
      final result = await _getRestaurantUseCase(event.restaurantId);
      result.fold(
        (l) => emit(
          Error(message: l.message),
        ),
        (r) => emit(
          Success(r),
        ),
      );
    });
  }

  final GetRestaurantUseCase _getRestaurantUseCase;
}
