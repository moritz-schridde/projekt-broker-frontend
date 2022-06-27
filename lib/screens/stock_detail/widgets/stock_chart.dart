import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/screens/stock_detail/stock_detail_screen_provider.dart';
import 'package:provider/provider.dart';

class StockChart extends StatelessWidget {
  const StockChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Consumer<StockDetailScreenProvider>(
        builder: (context, stockDetailScreenProvider, _) {
      if (stockDetailScreenProvider.stockPerformance == null) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      final range = stockDetailScreenProvider.stockPerformance!.range;

      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          width: double.infinity,
          height: 300,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(
                show: true,
                drawVerticalLine: true,
                horizontalInterval: 1,
                verticalInterval: 1,
                checkToShowHorizontalLine: (value) =>
                    (value % (range.toInt() ~/ 5) == 0),
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: const Color(0xfff3f3f3),
                    strokeWidth: 1,
                  );
                },
                getDrawingVerticalLine: (value) {
                  return FlLine(
                    color: const Color(0xfff3f3f3),
                    strokeWidth: (value % 10 == 0) ? 1 : 0,
                  );
                },
              ),
              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  tooltipBgColor: UiTheme.primaryGradientStartLight,
                  tooltipRoundedRadius: 10,
                  tooltipPadding: EdgeInsets.all(8),
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots.map((touchedSpot) {
                      final date = DateFormat.yMMMd().format(DateTime.now()
                          .subtract(
                            Duration(days: 100),
                          )
                          .add(
                            Duration(
                              days: touchedSpot.x.toInt(),
                            ),
                          ));
                      final value = touchedSpot.y.toStringAsFixed(2);
                      return LineTooltipItem(
                        '$date\n$value€',
                        TextStyle(
                          color: theme.primaryColor,
                          fontSize: 16,
                        ),
                      );
                    }).toList();
                  },
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 35,
                    interval: 20,
                    getTitlesWidget: bottomTitleWidgets,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: leftTitleWidgets,
                    reservedSize: 42,
                  ),
                ),
              ),
              borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: const Color(0xfff3f3f3), width: 1)),
              minX: 0,
              maxX: 100,
              minY: stockDetailScreenProvider.stockPerformance!.min * 0.95,
              maxY: stockDetailScreenProvider.stockPerformance!.max * 1.05,
              lineBarsData: [
                LineChartBarData(
                  spots: stockDetailScreenProvider.stockPerformance!.spots,
                  isCurved: true,
                  curveSmoothness: 0.25,
                  preventCurveOverShooting: true,
                  gradient: LinearGradient(
                    colors: [UiTheme.primaryColor, UiTheme.primaryColor],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  barWidth: 5,
                  isStrokeCapRound: true,
                  dotData: FlDotData(
                    show: false,
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [Colors.white, UiTheme.primaryGradientEnd]
                          .map((color) => color.withOpacity(0.3))
                          .toList(),
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    var style = UiTheme.lightTheme.textTheme.subtitle2!
        .copyWith(color: UiTheme.labelTextLight);
    // String text;
    // switch (value.toInt()) {
    //   case 1:
    //     text = '10K';
    //     break;
    //   case 3:
    //     text = '30k';
    //     break;
    //   case 5:
    //     text = '50k';
    //     break;
    //   default:
    //     return Container();
    // }
    return Text(value.toStringAsFixed(0),
        style: style, textAlign: TextAlign.left);
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    var style = UiTheme.lightTheme.textTheme.subtitle2!
        .copyWith(color: UiTheme.labelTextLight);

    final date = DateTime.now()
        .subtract(
          Duration(days: 100),
        )
        .add(
          Duration(
            days: value.toInt(),
          ),
        );

    final text = DateFormat('dd.MM').format(date);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: Text(text),
    );
  }
}
