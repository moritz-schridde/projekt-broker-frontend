import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/screens/stock_search/stock_search_screen_provider.dart';
import 'package:projekt_broker_frontend/widgets/stock_search_card.dart';
import 'package:projekt_broker_frontend/widgets/main_top_navigation_bar.dart';
import 'package:provider/provider.dart';

import '../../widgets/main_bottom_navigation_bar.dart';

class StockSearchScreen extends StatelessWidget {
  static const routeName = "/stock-search";
  const StockSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<StockSearchScreenProvider>(
      builder: (context, stockSearchScreenProvider, _) {
        return Scaffold(
          // appBar: MainTopNavigationBar.appBar(
          //   context: context,
          //   title: "Meine Orders",
          // ),
          body: Form(
            key: stockSearchScreenProvider.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 18.0,
                    vertical: 20.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.5,
                      style: BorderStyle.solid,
                      color: theme.primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Aktienname, Abkürzung, etc.",
                      suffixIcon: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: theme.primaryColor,
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (_) {
                      stockSearchScreenProvider.applyFilters();
                    },
                    onSaved: (searchTerm) {
                      stockSearchScreenProvider.searchTerm = searchTerm;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 18.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: theme.primaryColor,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: DropdownButtonFormField<StockSearchSortOption>(
                        hint: Text("Sortieren nach"),
                        items: stockSearchScreenProvider.sortOptions
                            .map(
                              (sortOption) =>
                                  DropdownMenuItem<StockSearchSortOption>(
                                value: sortOption,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      sortOption.name,
                                    ),
                                    Icon(
                                      sortOption.sortType == SortType.desc
                                          ? Icons.arrow_downward_rounded
                                          : Icons.arrow_upward_rounded,
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (dynamic value) {
                          stockSearchScreenProvider.applyFilters();
                        },
                        onSaved: (orderOverviewSortOption) {
                          stockSearchScreenProvider.orderOverviewSortOption =
                              orderOverviewSortOption;
                        },
                        borderRadius: BorderRadius.circular(5),
                        focusColor: theme.primaryColor,
                        alignment: AlignmentDirectional.bottomCenter,
                        elevation: 2,
                        icon: Icon(Icons.keyboard_arrow_down),
                        iconEnabledColor: theme.primaryColor,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          constraints: BoxConstraints(
                            maxWidth: (MediaQuery.of(context).size.width / 1.8),
                          ),
                          hoverColor: Colors.transparent,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18.0,
                  ),
                  child: Text(
                    "Suchen",
                    style: theme.textTheme.headline4?.copyWith(
                      color: theme.primaryColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Builder(builder: (context) {
                    final stocks = stockSearchScreenProvider.stocks;
                    if (stocks == null) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (stocks.isEmpty) {
                      return Text("Es gibt kein Stocks!");
                    }
                    return ListView.separated(
                      separatorBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18.0,
                          ),
                          child: Divider(
                            color: theme.secondaryHeaderColor,
                            height: 2,
                            thickness: 1,
                          ),
                        );
                      },
                      itemCount: stocks.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return StockSearchCard(
                          stock: stocks[index],
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
          bottomNavigationBar: MainBottomNavigationBar(),
        );
      },
    );
  }
}
