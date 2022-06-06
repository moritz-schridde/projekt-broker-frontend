import 'package:flutter/cupertino.dart';

enum SortType { desc, asc }

enum SortCategory { alphabetisch, orderwert, aktienpreis }

class OrderOverviewSortOption {
  final SortType sortType;
  final SortCategory sortCategory;

  OrderOverviewSortOption({
    required this.sortType,
    required this.sortCategory,
  });

  String get name =>
      "${sortCategory.name[0].toUpperCase()}${sortCategory.name.substring(1).toLowerCase()}";
}

class OrderOverviewProvider with ChangeNotifier {
  List<OrderOverviewSortOption> sortOptions = [
    OrderOverviewSortOption(
      sortType: SortType.desc,
      sortCategory: SortCategory.alphabetisch,
    ),
    OrderOverviewSortOption(
      sortType: SortType.asc,
      sortCategory: SortCategory.alphabetisch,
    ),
    OrderOverviewSortOption(
      sortType: SortType.desc,
      sortCategory: SortCategory.orderwert,
    ),
    OrderOverviewSortOption(
      sortType: SortType.asc,
      sortCategory: SortCategory.orderwert,
    ),
    OrderOverviewSortOption(
      sortType: SortType.desc,
      sortCategory: SortCategory.aktienpreis,
    ),
    OrderOverviewSortOption(
      sortType: SortType.asc,
      sortCategory: SortCategory.aktienpreis,
    ),
  ];
}
