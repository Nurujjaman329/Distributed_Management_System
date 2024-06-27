import 'package:dms/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectIndex = -1;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        title: Text(
          "DMS",
          style: TextStyle(color: Colors.blueGrey),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.blueGrey,
        ),
      ),
      drawer: _drawer(),
      body: Column(
        children: [
          Container(
            width: w,
            height: h * .05,
            color: Colors.red,
            child: Wrap(
              children: [
                Icon(
                  Icons.dashboard,
                  color: Colors.white,
                ),
                Text(
                  "Dashboard",
                  style: CustomTextStyles.headline,
                )
              ],
            ),
          ),
        ],
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
