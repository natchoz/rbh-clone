abstract class RestaurantEvent {
  const RestaurantEvent();
}

class LoadDataEvent extends RestaurantEvent {
  LoadDataEvent(
    this.restaurantId,
  );
  final String restaurantId;
}
