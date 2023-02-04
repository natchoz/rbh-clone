import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rbh_food/features/home/domain/usecases/get_restaurant_category_use_case.dart';
import 'package:rbh_food/features/home/presentation/bloc/food_event.dart';
import 'package:rbh_food/features/home/presentation/bloc/food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc(
    this._getRestaurantCategoryUseCase,
  ) : super(Initial()) {
    on<LoadDataEvent>((event, emit) async {
      emit(Loading());
      final result = await _getRestaurantCategoryUseCase();
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

  final GetRestaurantCategoryUseCase _getRestaurantCategoryUseCase;
}
