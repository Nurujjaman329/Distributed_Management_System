import 'package:dms/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/custom_color.dart';

class Sales_Add extends StatefulWidget {
  const Sales_Add({super.key});

  @override
  State<Sales_Add> createState() => _Sales_AddState();
}

class _Sales_AddState extends State<Sales_Add> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColor.primaryColor,
        title: Text(
          'Retail List(Sales)',
          style: TextStyle(color: Color(0XFFF5E7B2)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'Retail',
                style: CustomTextStyles.bodyText,
              ),
            ),
            Card(
              color: Color(0XFFEAEAEA),
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("O&S MOBILE SHOP-TGL0056"),
                    Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
