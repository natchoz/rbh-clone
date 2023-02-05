import 'package:rbh_food/features/restaurant/domain/entities/menu.dart';

class CategoryMenu {
  const CategoryMenu({
    required this.id,
    required this.name,
    required this.menus,
  });
  final String id;
  final String name;
  final List<Menu> menus;
}
