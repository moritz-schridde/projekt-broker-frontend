import 'package:flutter/material.dart';

import '../../models/stock.dart';

class StockDetailScreenProvider with ChangeNotifier {
  final Stock stock;

  StockDetailScreenProvider({required this.stock});
}
