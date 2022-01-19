import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';

class PortfolioOverviewCard extends StatelessWidget {
  const PortfolioOverviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 250,
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
                      style: theme.textTheme.headline6
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
                          '2.500€',
                          style: theme.textTheme.headline6
                              ?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '+9,77%',
                          style: theme.textTheme.bodyText2
                              ?.copyWith(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    SizedBox(
                      height: 35,
                      child: Row(
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
                                '1.600,75€',
                                style: theme.textTheme.bodyText1
                                    ?.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                          const VerticalDivider(
                            color: Colors.white,
                            indent: 0,
                            endIndent: 0,
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
                                '1.600,75€',
                                style: theme.textTheme.bodyText1
                                    ?.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Container(),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                padding: EdgeInsets.symmetric(vertical: 10),
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
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Icon(Icons.file_upload_outlined),
                          Text("Einzahlen"),
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: UiTheme.primaryColorScheme.primary,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    // VerticalDivider(
                    //   color: UiTheme.primaryColorScheme.primary,
                    //   indent: 10,
                    //   endIndent: 10,
                    //   thickness: 1,
                    // ),
                    TextButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Icon(Icons.file_download_outlined),
                          Text("Auszahlen"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
