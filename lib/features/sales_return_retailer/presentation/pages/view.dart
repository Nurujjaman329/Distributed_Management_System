import 'package:dms/config/qr_code_scanner/qr_code_scanner_page.dart';
import 'package:dms/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/custom_color.dart';

class SalesReturn_Retailer extends StatefulWidget {
  const SalesReturn_Retailer({super.key});

  @override
  State<SalesReturn_Retailer> createState() => _SalesReturn_RetailerState();
}

class _SalesReturn_RetailerState extends State<SalesReturn_Retailer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColor.primaryColor,
        title: Text(
          'Retail List Return',
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
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: Text(
                'Retail',
                style: CustomTextStyles.bodyText,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QRCodeScannerPages(),
                  ),
                );
              },
              child: Card(
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
            ),
          ],
        ),
      ),
    );
  }
}
