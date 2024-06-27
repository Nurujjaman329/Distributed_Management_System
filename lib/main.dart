import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(DistributedManagementSystemApp());
}

class DistributedManagementSystemApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Distributed Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: _drawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Welcome to the Distributed Management System'),
            Expanded(
              child: SfCircularChart(
                title: ChartTitle(text: 'Sales Analysis'),
                legend: Legend(isVisible: true),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <CircularSeries<_SalesData, String>>[
                  PieSeries<_SalesData, String>(
                    dataSource: <_SalesData>[
                      _SalesData('Total Purchase', 241),
                      _SalesData('Total Sales', 220),
                      _SalesData('Recent Stock', 21),
                    ],
                    xValueMapper: (_SalesData sales, _) => sales.year,
                    yValueMapper: (_SalesData sales, _) => sales.sales,
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                  )
                ],
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                _buildGridItem(
                  context,
                  Icons.local_offer,
                  'Offers',
                  () {
                    // Navigate to Offers screen
                  },
                ),
                _buildGridItem(
                  context,
                  Icons.menu,
                  'Retailer Inventory',
                  () {
                    // Perform action for Retailer Inventory
                  },
                ),
                _buildGridItem(
                  context,
                  Icons.mobile_friendly,
                  'Products',
                  () {
                    // Perform action for Products
                  },
                ),
                _buildGridItem(
                  context,
                  Icons.attach_money,
                  'Sales',
                  () {
                    // Perform action for Sales
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, IconData iconData, String label,
      VoidCallback onTap) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 2.0),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  iconData,
                  size: 50.0,
                  color: Colors.blue,
                ),
                SizedBox(height: 8.0),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          _buildListTile(0, Icons.dashboard, 'Dashboard'),
          _buildListTile(1, Icons.refresh, 'Sales Add'),
          _buildListTile(2, Icons.refresh, 'Sales Return(Retailer)'),
          _buildListTile(3, Icons.refresh, 'Sales Return'),
          _buildListTile(4, Icons.menu, 'Purchase Confirm'),
          _buildListTile(5, Icons.mobile_friendly, 'Product'),
          _buildListTile(6, Icons.history, 'Return History'),
          _buildListTile(7, Icons.menu, 'Retailer Inventory'),
          _buildListTile(8, Icons.menu, 'Distributor Inventory'),
        ],
      ),
    );
  }

  Widget _buildListTile(int index, IconData? icon, String title) {
    return ListTile(
      leading: icon != null ? Icon(icon) : null,
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
      selected: _selectIndex == index,
      selectedTileColor: Colors.blue.withOpacity(0.5),
      onTap: () {
        setState(() {
          _selectIndex = index;
        });
      },
    );
  }
}

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: Center(
        child: Text('User Management Screen'),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
