import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/screens/order_overview/widgets/order_overview_card.dart';
import 'package:projekt_broker_frontend/widgets/main_bottom_navigation_bar.dart';
import 'package:projekt_broker_frontend/widgets/main_top_navigation_bar.dart';

class OrderOverviewScreen extends StatelessWidget {
  static const routeName = "/order-overview";
  const OrderOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      // appBar: MainTopNavigationBar.appBar(
      //   context: context,
      //   title: "Meine Orders",
      // ),
      body: Column(
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
                color: UiTheme.primaryColor,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Aktienname, Abkürzung, etc.",
                suffixIcon: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: UiTheme.primaryColor,
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
                    color: UiTheme.primaryColor,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: DropdownButtonFormField(
                  hint: Text("Sortieren nach..."),
                  // value: "",

                  items: [
                    DropdownMenuItem(
                      value: "0",
                      child: Container(
                        color: Colors.lime,
                        child: Text("Test"),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "1",
                      child: Text("Test2"),
                    ),
                    DropdownMenuItem(
                      value: "2",
                      child: Text("Test3"),
                    ),
                    DropdownMenuItem(
                      value: "3",
                      child: Text("Tes4"),
                    ),
                    DropdownMenuItem(
                      value: "4",
                      child: Text("Test5"),
                    ),
                  ],
                  onChanged: (dynamic value) {
                    print("Test");
                  },
                  borderRadius: BorderRadius.circular(5),
                  focusColor: UiTheme.primaryColor,
                  alignment: AlignmentDirectional.bottomCenter,
                  elevation: 2,
                  icon: Icon(Icons.keyboard_arrow_down),
                  iconEnabledColor: UiTheme.primaryColor,
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
              "Meine Orders",
              style: theme.textTheme.headline4?.copyWith(
                color: UiTheme.primaryColor,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18.0,
                  ),
                  child: Divider(
                    color: UiTheme.lightTheme.secondaryHeaderColor,
                    height: 2,
                    thickness: 1,
                  ),
                );
              },
              itemCount: 9,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return OrderOverviewCard();
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: MainBottomNavigationBar(),
    );
  }
}
