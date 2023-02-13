import 'package:core/utils/rbh_utils.dart';

abstract class MenuDetailsEvent {
  MenuDetailsEvent(this.price);
  final double price;
  
  String getTotalDisplayPrice() {
    return RbhUtils.convertDisplayPrice(price);
  }
}

class AddMenuEvent extends MenuDetailsEvent {
  AddMenuEvent(double price) : super(price);
}

class RemoveMenuEvent extends MenuDetailsEvent {
  RemoveMenuEvent(double price) : super(price);
}

class AddToBasketEvent extends MenuDetailsEvent {
  AddToBasketEvent(double price) : super(price);
}
