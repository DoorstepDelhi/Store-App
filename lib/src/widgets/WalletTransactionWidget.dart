import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WalletTransactionWidget extends StatefulWidget {
    
  @override
  _WalletTransactionWidgetState createState() => _WalletTransactionWidgetState();
}

class _WalletTransactionWidgetState extends State<WalletTransactionWidget> {
  List<pieData> _chartData;

  @override
  void initState() {
    // TODO: implement initState
    _chartData = getpieData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SfCircularChart(
          series: <CircularSeries>[
            PieSeries<pieData, String>(
              dataSource: _chartData,
              xValueMapper: (pieData data, _) => data.label,
              yValueMapper: (pieData data, _) => data.point,
            )
          ],
        ),
      ],
    );
  }

  List<pieData> getpieData() {
    final List<pieData> chartData =[
      pieData('Redeemable', 200),
      pieData('Non-Redeemable', 1000),
    ];
    return chartData;
  }
}

class pieData{
  pieData(this.label, this.point);
  final String label;
  final int point;
}



