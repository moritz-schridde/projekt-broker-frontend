import 'package:flutter/cupertino.dart';
import 'package:projekt_broker_frontend/models/order.dart';
import 'package:projekt_broker_frontend/models/stock.dart';
import 'package:projekt_broker_frontend/provider/order_provider.dart';

enum SortType { desc, asc }

enum SortCategory { alphabetisch, orderwert, aktienpreis }

class OrderOverviewSortOption {
  final SortType sortType;
  final SortCategory sortCategory;
  final int Function(Order, Order) sortFunction;

  OrderOverviewSortOption({
    required this.sortType,
    required this.sortCategory,
    required this.sortFunction,
  });

  String get name =>
      "${sortCategory.name[0].toUpperCase()}${sortCategory.name.substring(1).toLowerCase()}";
}

class OrderOverviewProvider with ChangeNotifier {
  //dependencies
  final OrderProvider orderProvider;

  //state
  List<Order>? _orders;
  late GlobalKey<FormState> formKey;
  String? searchTerm;
  OrderOverviewSortOption? orderOverviewSortOption;

  //config
  List<OrderOverviewSortOption> sortOptions = [
    OrderOverviewSortOption(
      sortType: SortType.desc,
      sortCategory: SortCategory.alphabetisch,
      sortFunction: (a, b) =>
          a.info.stock.longName.compareTo(b.info.stock.longName),
    ),
    OrderOverviewSortOption(
      sortType: SortType.asc,
      sortCategory: SortCategory.alphabetisch,
      sortFunction: (a, b) =>
          b.info.stock.longName.compareTo(a.info.stock.longName),
    ),
    OrderOverviewSortOption(
      sortType: SortType.desc,
      sortCategory: SortCategory.orderwert,
      sortFunction: (a, b) => a.info.value.compareTo(b.info.value),
    ),
    OrderOverviewSortOption(
      sortType: SortType.asc,
      sortCategory: SortCategory.orderwert,
      sortFunction: (a, b) => b.info.value.compareTo(a.info.value),
    ),
    OrderOverviewSortOption(
      sortType: SortType.desc,
      sortCategory: SortCategory.aktienpreis,
      sortFunction: (a, b) => a.info.stockPrice.compareTo(b.info.stockPrice),
    ),
    OrderOverviewSortOption(
      sortType: SortType.asc,
      sortCategory: SortCategory.aktienpreis,
      sortFunction: (a, b) => b.info.value.compareTo(a.info.value),
    ),
  ];

  OrderOverviewProvider({required this.orderProvider}) {
    init();
  }

  void init() {
    _orders = null;
    formKey = GlobalKey<FormState>();
  }

  List<Order>? get orders {
    // fetch
    _orders ??= orderProvider.orders;
    List<Order>? displayedOrders = _orders;

    // filter
    formKey.currentState!.save();
    if (searchTerm != null) {
      final _searchTerm = searchTerm!.toLowerCase();
      displayedOrders = displayedOrders?.where((order) {
        final _longName = order.info.stock.longName.toLowerCase();
        final _shortName = order.info.stock.shortName.toLowerCase();

        return _longName.contains(_searchTerm) ||
            _shortName.contains(_searchTerm);
      }).toList();
    }
    // sort
    if (orderOverviewSortOption != null) {
      displayedOrders?.sort(orderOverviewSortOption!.sortFunction);
    }

    // display
    return displayedOrders;
  }

  void applyFilters() {
    notifyListeners();
  }
}
