import 'package:bloc/bloc.dart';
import 'package:rbh_food/features/restaurant/presentation/menu_details/bloc/menu_details_event.dart';
import 'package:rbh_food/features/restaurant/presentation/menu_details/bloc/menu_details_state.dart';

class MenuDetailsBloc extends Bloc<MenuDetailsEvent, MenuDetailsState> {
  MenuDetailsBloc() : super(const MenuDetailsInitial()) {
    on<AddMenuEvent>((event, emit) {
      emit(MenuState(state.count + 1));
    });

    on<RemoveMenuEvent>((event, emit) {
      emit(MenuState(state.count - 1));
      if (state.count == 0) {
        emit(const EmptyBasket());
      }
    });
  }
}
