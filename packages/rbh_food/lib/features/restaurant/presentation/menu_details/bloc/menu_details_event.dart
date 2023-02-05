part of 'menu_details_bloc.dart';

@immutable
abstract class MenuDetailsEvent {}

class AddMenuEvent extends MenuDetailsEvent {}

class RemoveMenuEvent extends MenuDetailsEvent {}
