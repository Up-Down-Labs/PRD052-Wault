import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wault/graphical_stats/line_data.dart';
import 'package:wault/numeric_stats/current_wallet/wallet_model.dart';

class LineGrpah extends StatefulWidget {
  const LineGrpah({super.key});

  @override
  State<LineGrpah> createState() => _LineGrpahState();
}

class _LineGrpahState extends State<LineGrpah> {
  @override
  Widget build(BuildContext context) => Consumer<WalletModel>(
        builder: (context, value, child) => LineChart(
          LineChartData(
            minX: 1,
            maxX: DateTime.now().day.toDouble(),
            minY: 0,
            maxY: LineData.getMaxY(),
            lineBarsData: [
              LineChartBarData(
                spots: LineData.getTitleData(),
                isCurved: true,
                preventCurveOverShooting: true,
                color: Theme.of(context).colorScheme.primary,
                belowBarData: BarAreaData(
                    show: true,
                    color:
                        Theme.of(context).colorScheme.secondary.withAlpha(100)),
              ),
            ],
            titlesData: FlTitlesData(
                show: true,
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  axisNameSize: 24,
                  axisNameWidget: const Center(
                    child: Text(
                      'OCTOBER',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 36,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 4,
                        child: Center(
                          child: Text(
                            value.toString(),
                            style: const TextStyle(
                              fontSize: 10,
                              // color: mainLineColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 36,
                  interval: LineData.getInterval(),
                  getTitlesWidget: (value, meta) {
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      space: 10,
                      child: Center(
                        child: Text(
                          NumberFormat.compact().format(value),
                          style: const TextStyle(
                            fontSize: 10,
                            // color: mainLineColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ))),
            gridData: const FlGridData(drawVerticalLine: false),
            borderData: FlBorderData(show: false),
          ),
        ),
      );
}
