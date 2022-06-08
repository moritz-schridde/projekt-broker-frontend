import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';

class StockChart extends StatelessWidget {
  const StockChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const dataSpots = [
      FlSpot(0, 3),
      FlSpot(2.6, 2),
      FlSpot(4.9, 5),
      FlSpot(6.8, 3.1),
      FlSpot(8, 4),
      FlSpot(9.5, 3),
      FlSpot(11, 4),
    ];

    var theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
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
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: const Color(0xfff3f3f3),
                  strokeWidth: 1,
                );
              },
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: const Color(0xfff3f3f3),
                  strokeWidth: 1,
                );
              },
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
                  reservedSize: 30,
                  interval: 1,
                  getTitlesWidget: bottomTitleWidgets,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: leftTitleWidgets,
                  reservedSize: 42,
                ),
              ),
            ),
            borderData: FlBorderData(
                show: true,
                border: Border.all(color: const Color(0xfff3f3f3), width: 1)),
            minX: 0,
            maxX: 11,
            minY: 0,
            maxY: 6,
            lineBarsData: [
              LineChartBarData(
                spots: dataSpots,
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
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    var style = UiTheme.lightTheme.textTheme.subtitle2!
        .copyWith(color: UiTheme.labelTextLight);
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    var style = UiTheme.lightTheme.textTheme.subtitle2!
        .copyWith(color: UiTheme.labelTextLight);
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = Text('MAR', style: style);
        break;
      case 5:
        text = Text('JUN', style: style);
        break;
      case 8:
        text = Text('SEP', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }
}
