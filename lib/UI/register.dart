import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  createAlertDialog(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Register to the event'),
            content: TextField(
              controller: controller,
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text('Confirm'),
                onPressed: () {},
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: 200.0,
        // width: double.infinity,
        // color: Colors.blueAccent[100],
        // child: Align(
        //   alignment: Alignment(-0.40,0.90),
        //   child: Text('Upcomming Events',
        //   style: TextStyle(
        //   color: Colors.white,
        //   fontSize: 30.0,
        //    ),
        //   ),
        // ),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.brightness_auto),
              title: Text(
                'Upcomming Event',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              subtitle: Text(
                'DD/MM/YYY',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12.0,
                ),
              ),
              trailing: Icon(Icons.menu_open),
              onTap: () {
                createAlertDialog(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.brightness_auto),
              title: Text(
                'Upcomming Event',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              subtitle: Text(
                'DD/MM/YYY',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12.0,
                ),
              ),
              trailing: Icon(Icons.menu_open),
              onTap: () {
                createAlertDialog(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.brightness_auto),
              title: Text(
                'Upcomming Event',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              subtitle: Text(
                'DD/MM/YYY',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12.0,
                ),
              ),
              trailing: Icon(Icons.menu_open),
              onTap: () {
                createAlertDialog(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.brightness_auto),
              title: Text(
                'Upcomming Event',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              subtitle: Text(
                'DD/MM/YYY',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12.0,
                ),
              ),
              trailing: Icon(Icons.menu_open),
              onTap: () {
                createAlertDialog(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.brightness_auto),
              title: Text(
                'Upcomming Event',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              subtitle: Text(
                'DD/MM/YYY',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12.0,
                ),
              ),
              trailing: Icon(Icons.menu_open),
              onTap: () {
                createAlertDialog(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.brightness_auto),
              title: Text(
                'Upcomming Event',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              subtitle: Text(
                'DD/MM/YYY',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12.0,
                ),
              ),
              trailing: Icon(Icons.menu_open),
              onTap: () {
                createAlertDialog(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.brightness_auto),
              title: Text(
                'Upcomming Event',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              subtitle: Text(
                'DD/MM/YYY',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12.0,
                ),
              ),
              trailing: Icon(Icons.menu_open),
              onTap: () {
                createAlertDialog(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.brightness_auto),
              title: Text(
                'Upcomming Event',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              subtitle: Text(
                'DD/MM/YYY',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12.0,
                ),
              ),
              trailing: Icon(Icons.menu_open),
              onTap: () {
                createAlertDialog(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.brightness_auto),
              title: Text(
                'Upcomming Event',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              subtitle: Text(
                'DD/MM/YYY',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12.0,
                ),
              ),
              trailing: Icon(Icons.menu_open),
              onTap: () {
                createAlertDialog(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.brightness_auto),
              title: Text(
                'Upcomming Event',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              subtitle: Text(
                'DD/MM/YYY',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12.0,
                ),
              ),
              trailing: Icon(Icons.menu_open),
              onTap: () {
                createAlertDialog(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.brightness_auto),
              title: Text(
                'Upcomming Event',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              subtitle: Text(
                'DD/MM/YYY',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12.0,
                ),
              ),
              trailing: Icon(Icons.menu_open),
              onTap: () {
                createAlertDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Container(
//         child: Align(
//           alignment: Alignment(-0.75,-0.75),
//           child: Text('Upcomming Events',
//           style: TextStyle(
//             fontSize: 30.0,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//          ),
//         ),
//       ),
