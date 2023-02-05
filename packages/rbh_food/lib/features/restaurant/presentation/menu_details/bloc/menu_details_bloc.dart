import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'menu_details_event.dart';
part 'menu_details_state.dart';

class MenuDetailsBloc extends Bloc<MenuDetailsEvent, MenuDetailsState> {
  MenuDetailsBloc() : super(MenuDetailsInitial()) {
    on<MenuDetailsEvent>((event, emit) {
      
    });
  }
}
