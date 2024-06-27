import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'data_model.dart';

class DashboardScreens extends StatefulWidget {
  @override
  _DashboardScreensState createState() => _DashboardScreensState();
}

class _DashboardScreensState extends State<DashboardScreens> {
  @override
  void initState() {
    super.initState();
    Provider.of<DataModel>(context, listen: false).fetchMetrics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DMS Dashboard'),
      ),
      body: Consumer<DataModel>(
        builder: (context, dataModel, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                _buildCard(
                  title: 'Metric 1',
                  value: dataModel.metric1.toString(),
                ),
                _buildCard(
                  title: 'Metric 2',
                  value: dataModel.metric2.toString(),
                ),
                _buildChart(dataModel),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCard({required String title, required String value}) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(title),
        trailing: Text(value, style: TextStyle(fontSize: 20)),
      ),
    );
  }

  Widget _buildChart(DataModel dataModel) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(20),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <ChartSeries>[
          LineSeries<ChartData, String>(
            dataSource: [
              ChartData('Metric 1', dataModel.metric1),
              ChartData('Metric 2', dataModel.metric2),
            ],
            xValueMapper: (ChartData data, _) => data.category,
            yValueMapper: (ChartData data, _) => data.value,
          )
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.category, this.value);
  final String category;
  final int value;
}
