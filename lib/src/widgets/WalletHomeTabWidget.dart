import 'package:flutter/material.dart';
import 'package:store_app/config/ui_icons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WalletHomeTabWidget extends StatefulWidget {
  @override
  _WalletHomeTabWidgetState createState() => _WalletHomeTabWidgetState();
}

class _WalletHomeTabWidgetState extends State<WalletHomeTabWidget> {
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
        Container(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SfCircularChart(
              legend: Legend(
                isVisible: true,
                overflowMode: LegendItemOverflowMode.wrap
              ),
              title: ChartTitle(text: 'Total 1200', textStyle: TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.bold) ),
              series: <CircularSeries>[
                PieSeries<pieData, String>(
                  dataSource: _chartData,
                  xValueMapper: (pieData data, _) => data.label,
                  yValueMapper: (pieData data, _) => data.point,
                )
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.9),
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).focusColor.withOpacity(0.15),
                  blurRadius: 5,
                  offset: Offset(0, -2)),
            ],
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                    onPressed: () {
                      setState(() {});
                    },
                    padding: EdgeInsets.symmetric(vertical: 14),
                    color: Theme.of(context).accentColor,
                    shape: StadiumBorder(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Icons.add,
                            color: Theme.of(context).primaryColor,
                          ),
                          Text(
                            'Add Money',
                            style: TextStyle(color: Theme.of(context).primaryColor),
                          )
                        ],
                      ),
                    ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    setState(() {});
                  },
                  padding: EdgeInsets.symmetric(vertical: 14),
                  color: Theme.of(context).accentColor,
                  shape: StadiumBorder(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.redo_sharp,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text(
                          'Share Points',
                          style: TextStyle(color: Theme.of(context).primaryColor),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'March 2021',
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontStyle: FontStyle.italic,
                  fontSize:15
              ),
            ),
          ),
        )
      ],
    );
  }
  List<pieData> getpieData() {
    final List<pieData> chartData =[
      pieData('Redeemable : 200', 200),
      pieData('Non-Redeemable : 1000', 1000),
    ];
    return chartData;
  }


}

class pieData{
  pieData(this.label, this.point);
  final String label;
  final int point;
}

