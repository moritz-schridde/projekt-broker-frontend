import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/screens/home/widgets/portfolio_overview_button.dart';
import 'package:projekt_broker_frontend/widgets/draggable_overview.dart';

class PortfolioOverviewCard extends StatelessWidget {
  const PortfolioOverviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final percent = 9.77;
    return Container(
      height: 260,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 2,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(15.0),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color.fromARGB(255, 138, 43, 226),
                  Color.fromARGB(255, 182, 137, 223),
                ],
              ),
            ),
            width: double.infinity,
            child: Center(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 30,
                  bottom: 50,
                  right: 10,
                  left: 10,
                ),
                // color: Colors.lightGreen,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Portfolio',
                      style: theme.textTheme.headline5
                          ?.copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Gesamtwert',
                      style: theme.textTheme.bodyText2
                          ?.copyWith(color: Colors.white),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          NumberFormat.currency(
                                  locale: 'de',
                                  name: 'euro',
                                  symbol: '€',
                                  decimalDigits: 2)
                              .format(3600.89),
                          style: theme.textTheme.headline5
                              ?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '+$percent%',
                          style: theme.textTheme.bodyText2
                              ?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Investiert',
                              style: theme.textTheme.bodyText2
                                  ?.copyWith(color: Colors.white),
                            ),
                            Text(
                              NumberFormat.currency(
                                      locale: 'de',
                                      name: 'euro',
                                      symbol: '€',
                                      decimalDigits: 2)
                                  .format(2600.75),
                              style: theme.textTheme.bodyText1
                                  ?.copyWith(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                        Container(
                          height: 30,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Guthaben',
                              style: theme.textTheme.bodyText2
                                  ?.copyWith(color: Colors.white),
                            ),
                            Text(
                              NumberFormat.currency(
                                      locale: 'de',
                                      name: 'euro',
                                      symbol: '€',
                                      decimalDigits: 2)
                                  .format(1600.75),
                              style: theme.textTheme.bodyText1
                                  ?.copyWith(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          PortfolioOverviewButton(),
        ],
      ),
    );
  }
}
