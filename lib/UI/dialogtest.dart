import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dtest extends StatefulWidget {
  @override
  _DtestState createState() => _DtestState();
}

class _DtestState extends State<Dtest> {
  void dialogTest() {
    Get.dialog(AlertDialog(
        title: Text('Edit Club Details'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                    labelText: 'Club Name', border: OutlineInputBorder()),
              ),
              SizedBox(height: 24),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Description', border: OutlineInputBorder()),
              ),
              SizedBox(height: 24),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Club Logo', border: OutlineInputBorder()),
              ),
              SizedBox(height: 8),
              SizedBox(height: 32),
              Container(
                height: 48,
                width: Get.width,
                child: RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: Colors.blueGrey[400],
                  child: new Text("ADD"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  onPressed: () {},
                ),
              )
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Club Details"),
        backgroundColor: Color(0xFF90A4AE),
      ),
      body: Center(
        child: RaisedButton(
          padding: const EdgeInsets.all(8.0),
          textColor: Colors.white,
          color: Colors.blueGrey[600],
          child: new Text("Edit"),
          onPressed: () {
            dialogTest();
          },
        ),
      ),
    );
  }
}
