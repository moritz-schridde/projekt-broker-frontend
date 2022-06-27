import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:projekt_broker_frontend/models/order.dart';
import 'package:projekt_broker_frontend/models/stock.dart';
import 'package:projekt_broker_frontend/provider/order_provider.dart';

import '../../provider/stock_provider.dart';

enum SortType { desc, asc }

enum SortCategory { alphabetisch, aktienpreis }

class StockSearchSortOption {
  final SortType sortType;
  final SortCategory sortCategory;
  final int Function(Stock, Stock) sortFunction;

  StockSearchSortOption({
    required this.sortType,
    required this.sortCategory,
    required this.sortFunction,
  });

  String get name =>
      "${sortCategory.name[0].toUpperCase()}${sortCategory.name.substring(1).toLowerCase()}";
}

class StockSearchScreenProvider with ChangeNotifier {
  //dependencies
  final StockProvider stockProvider;

  //state
  List<Stock>? _stocks;
  late GlobalKey<FormState> formKey;
  String? searchTerm;
  StockSearchSortOption? orderOverviewSortOption;

  //config
  List<StockSearchSortOption> sortOptions = [
    StockSearchSortOption(
      sortType: SortType.desc,
      sortCategory: SortCategory.alphabetisch,
      sortFunction: (a, b) => a.longName.compareTo(b.longName),
    ),
    StockSearchSortOption(
      sortType: SortType.asc,
      sortCategory: SortCategory.alphabetisch,
      sortFunction: (a, b) => b.longName.compareTo(a.longName),
    ),
    StockSearchSortOption(
      sortType: SortType.desc,
      sortCategory: SortCategory.aktienpreis,
      sortFunction: (a, b) => a.price.compareTo(b.price),
    ),
    StockSearchSortOption(
      sortType: SortType.asc,
      sortCategory: SortCategory.aktienpreis,
      sortFunction: (a, b) => b.price.compareTo(a.price),
    ),
  ];

  StockSearchScreenProvider({required this.stockProvider}) {
    init();
  }

  void init() {
    _stocks = null;
    formKey = GlobalKey<FormState>();
    stockProvider.addListener(notifyListeners);
  }

  @override
  void dispose() {
    stockProvider.removeListener(notifyListeners);
    super.dispose();
  }

  List<Stock>? get stocks {
    // fetch
    _stocks ??= stockProvider.stocks;
    List<Stock>? displayedStocks = _stocks;

    // filter
    formKey.currentState!.save();
    if (searchTerm != null) {
      final _searchTerm = searchTerm!.toLowerCase();
      displayedStocks = displayedStocks?.where((stock) {
        final _longName = stock.longName.toLowerCase();
        final _shortName = stock.shortName.toLowerCase();

        return _longName.contains(_searchTerm) ||
            _shortName.contains(_searchTerm);
      }).toList();
    }
    // sort
    if (orderOverviewSortOption != null) {
      displayedStocks?.sort(orderOverviewSortOption!.sortFunction);
    }

    // display
    return displayedStocks;
  }

  void applyFilters() {
    notifyListeners();
  }
}
