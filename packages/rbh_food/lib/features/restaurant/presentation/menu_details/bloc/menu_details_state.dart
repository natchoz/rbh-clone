import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MenuDetailsState extends Equatable {
  const MenuDetailsState(this.count);
  final int count;
}

class MenuDetailsInitial extends MenuDetailsState {
  const MenuDetailsInitial() : super(1);

  @override
  List<Object?> get props => [];
}

class MenuState extends MenuDetailsState {
  const MenuState(int count) : super(count);
  @override
  List<Object?> get props => [count];
}

class EmptyBasket extends MenuDetailsState {
  const EmptyBasket() : super(0);
  @override
  List<Object?> get props => [count];
}
