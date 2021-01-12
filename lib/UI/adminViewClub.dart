import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminViewClub extends StatefulWidget {
//  final String imagePath;
  final String clubName;
  final String description;
  final String imgUrl;

  const AdminViewClub({Key key, this.clubName, this.description, this.imgUrl})
      : super(key: key);

  @override
  _AdminViewClubState createState() =>
      _AdminViewClubState(clubName, description, imgUrl);
}

class _AdminViewClubState extends State<AdminViewClub> {
  final String clubName;
  final String description;
  final String imgUrl;

  _AdminViewClubState(this.clubName, this.description, this.imgUrl);
  Widget textfield({@required String hintText}) {
    return Material(
      elevation: 30,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              letterSpacing: 2,
              color: Colors.black54,
              fontWeight: FontWeight.bold),
          fillColor: Colors.white30,
          filled: false,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF00B0FF),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              //  crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 60.0),
                      Text(widget.description),
                      SizedBox(height: 70.0),
                      Container(
                        height: 35,
                        width: double.infinity,
                        child: RaisedButton(
                          onPressed: () {
                            dialogTest(clubName, description, imgUrl);
                          },
                          color: Colors.green,
                          child: Center(
                            child: Text(
                              "Edit Profile",
                              style: TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(0),
                child: Text(widget.clubName,
                    style: TextStyle(
                        fontSize: 35,
                        letterSpacing: 1.5,
                        color: Colors.white,
                        fontWeight: FontWeight.w600)),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height - 430,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage(widget.imgUrl), fit: BoxFit.fill),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 200, left: 184),
          ),
        ],
      ),
    );
  }

  void dialogTest(
    String clubName,
    String description,
    String imageUrl,
  ) {
    Get.dialog(AlertDialog(
        title: Text(
          'Edit Club Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  width: Get.width, height: 50, child: Image.network(imageUrl)),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    clubName = value;
                  });
                },
                initialValue: clubName,
                decoration: InputDecoration(
                    hintText: clubName,
                    labelText: 'Club Name',
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 24),
              TextFormField(
                initialValue: description,
                decoration: InputDecoration(
                    hintText: description,
                    labelText: "Description",
                    border: OutlineInputBorder()),
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
              ),
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
                  onPressed: () {
                    // Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        )));
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xFF00B0FF);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 190, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
