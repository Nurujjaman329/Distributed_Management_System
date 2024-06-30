import 'package:dms/features/sales_add/presentation/pages/view.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../core/styles/custom_color.dart';
import '../../../../sales_return_retailer/presentation/pages/view.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  int _selectIndex = -1;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColor.primaryColor,
        title: Text(
          'Dashboard',
          style: TextStyle(color: Color(0XFFF5E7B2)),
        ),
        centerTitle: true,
      ),
      drawer: _drawer(),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                height: h / 4.0,
                width: w,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0XFF7f30fe), Color(0XFF6380fb)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(w, 105.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 70.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Dashboard',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Overview of Your System',
                        style: TextStyle(
                          color: Color(0XFFbbb0ff),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: h / 2.5,
                      padding: const EdgeInsets.all(7.0),
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: SfCircularChart(
                        title: ChartTitle(
                          text: 'Sales Analysis',
                          textStyle: TextStyle(color: Colors.black),
                        ),
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
                            dataLabelSettings:
                                DataLabelSettings(isVisible: true),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0, // Adds space between the chart and the grid
                    ),
                    GridView.count(
                      crossAxisCount: 4,
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
                          'Inventory',
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
                          'Inventory',
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, IconData iconData, String label,
      VoidCallback onTap) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.white, width: 2.0),
            gradient: CustomColor.primaryGradient,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  iconData,
                  size: 30.0,
                  color: Colors.white,
                ),
                SizedBox(height: 8.0),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
      backgroundColor: CustomColor.primaryColor,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(),
            child: Column(
              children: [
                ClipOval(
                  child: Image.asset('assets/man.png',
                      fit: BoxFit.cover, scale: 6),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  'DMS user',
                  style: TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                )
              ],
            ),
          ),
          _buildListTile(1, Icons.add_box, 'Sales Add', () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Sales_Add(),
              ),
            );
          }),
          _buildListTile(2, Icons.undo, 'Sales Return(Retailer)', () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SalesReturn_Retailer(),
              ),
            );
          }),
          _buildListTile(3, Icons.loop, 'Sales Return', () {
            // Navigate to Sales Return screen
          }),
          _buildListTile(4, Icons.check_circle, 'Purchase Confirm', () {
            // Navigate to Purchase Confirm screen
          }),
          _buildListTile(5, Icons.mobile_friendly, 'Product', () {
            // Navigate to Product screen
          }),
          _buildListTile(6, Icons.history, 'Return History', () {
            // Navigate to Return History screen
          }),
          _buildListTile(7, Icons.inventory, 'Retailer Inventory', () {
            // Navigate to Retailer Inventory screen
          }),
          _buildListTile(8, Icons.business, 'Distributor Inventory', () {
            // Navigate to Distributor Inventory screen
          }),
          _buildListTile(9, Icons.logout, 'Logout', () {
            // Perform logout action
          }),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'V ${_packageInfo.version}',
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(
      int index, IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white54,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colors.white54,
      ),
      selected: _selectIndex == index,
      selectedTileColor: Color(0XFF3DC2EC).withOpacity(0.5),
      onTap: () {
        setState(() {
          _selectIndex = index;
        });
        onTap();
      },
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
