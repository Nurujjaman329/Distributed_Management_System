import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/styles/custom_color.dart';

class QRCodeScannerPages extends StatefulWidget {
  const QRCodeScannerPages({super.key});

  @override
  State<QRCodeScannerPages> createState() => _QRCodeScannerPagesState();
}

class _QRCodeScannerPagesState extends State<QRCodeScannerPages> {
  List<String> scannedCodes = [];
  TextEditingController _outputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _outputController = TextEditingController();
    _loadScannedCodes();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CustomColor.primaryColor,
          title: Text(
            'IMEI Scan for O&S Mobile Shop Sales',
            style: TextStyle(color: Color(0XFFF5E7B2)),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: height * .1,
                    width: width * .7,
                    child: TextField(
                      controller: _outputController,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        //prefixIcon: Icon(Icons.wrap_text),
                        //helperText: 'The QR code details will be shown below',
                        hintText: 'Type or Scan IMEI/Serial',
                        hintStyle: TextStyle(fontSize: 15),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 15),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: height * .06,
                      width: width * .08,
                      child: _buttonGroup()),
                ],
              ),
              Container(
                height: height * .05,
                width: width,
                decoration: BoxDecoration(
                  color: CustomColor.primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextButton(
                  onPressed: () {
                    _addManualEntry();
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white54),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: scannedCodes.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        trailing: InkWell(
                          onTap: () {
                            print('test->');

                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title:
                                    const Text("Do You Want to delete this ? "),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(14),
                                      child: const Text("No"),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      _deleteScannedCode(index);
                                      Navigator.of(ctx).pop();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(14),
                                      child: const Text("Yes"),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Icon(
                            Icons.remove,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                        title: Text(scannedCodes[index]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonGroup() {
    return InkWell(
      onTap: _scan,
      child: Column(
        children: <Widget>[
          Icon(Icons.qr_code),
          Divider(height: 20),
        ],
      ),
    );
  }

  Future _scan() async {
    await Permission.camera.request();
    String? barcode = await scanner.scan();
    if (barcode == null) {
      print('nothing return.');
    } else {
      setState(() {
        _outputController.text = barcode;
        scannedCodes.insert(0, barcode);
        _outputController.clear();
      });
      _saveScannedCodes();
    }
  }

  Future<void> _addManualEntry() async {
    String manualEntry = _outputController.text;
    if (manualEntry.isNotEmpty) {
      setState(() {
        scannedCodes.insert(0, manualEntry);
        _outputController.clear();
      });
      _saveScannedCodes();
    }
  }

  Future<void> _saveScannedCodes() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('scannedCodes', jsonEncode(scannedCodes));
  }

  Future<void> _loadScannedCodes() async {
    final prefs = await SharedPreferences.getInstance();
    String? scannedCodesString = prefs.getString('scannedCodes');
    if (scannedCodesString != null) {
      setState(() {
        scannedCodes = List<String>.from(jsonDecode(scannedCodesString));
      });
    }
  }

  Future<void> _deleteScannedCode(int index) async {
    setState(() {
      scannedCodes.removeAt(index);
    });
    _saveScannedCodes();
  }
}
