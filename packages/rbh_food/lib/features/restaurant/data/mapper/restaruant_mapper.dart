import 'package:rbh_food/features/restaurant/data/dto/get_restaurants_response.dart';
import 'package:rbh_food/features/restaurant/domain/entities/category_menu.dart';
import 'package:rbh_food/features/restaurant/domain/entities/menu.dart';
import 'package:rbh_food/features/restaurant/domain/entities/restaurant.dart';

class RestaurantMapper {
  List<Restaurant> mapDtoToEntity(List<RestaurantDto> dtos) => dtos
      .map(
        (dto) => mapRestaurantDtoToEntity(dto),
      )
      .toList();

  Restaurant mapRestaurantDtoToEntity(RestaurantDto dto) => Restaurant(
        id: dto.id,
        name: dto.name,
        imageUrl: dto.imageUrl,
        categoryMenus: _mapCategoryDtoToEntity(dto.categories),
      );

  List<CategoryMenu> _mapCategoryDtoToEntity(List<CategoryDto> dtos) => dtos
      .map((dto) => CategoryMenu(
            id: dto.id,
            name: dto.name,
            menus: _mapMenuDtoToEntity(dto.menus),
          ))
      .toList();

  List<Menu> _mapMenuDtoToEntity(List<MenuDto> dtos) => dtos
      .map((dto) => Menu(
            id: dto.id,
            name: dto.name,
            imageUrl: dto.imageUrl,
            price: dto.price,
            active: dto.active,
          ))
      .toList();
}
