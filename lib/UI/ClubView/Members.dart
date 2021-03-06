import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Memebers extends StatefulWidget {
  final String clubID;

  const Memebers({Key key, this.clubID}) : super(key: key);
  @override
  _MemebersState createState() => _MemebersState();
}

class _MemebersState extends State<Memebers> {
  List<String> members = [];

  FirebaseFirestore fbase = FirebaseFirestore.instance;
  getMembers() {
    fbase.collection('Users').get().then((value) {
      value.docs.forEach((element) {
        List clubs = element['Clubs'];
        if (clubs.contains(widget.clubID)) {
          members.add(element.id);
        }
      });
    }).then((value) {
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    getMembers();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      height: Get.height * 0.7,
      child: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(members[index]),
            ),
          );
        },
      ),
    );
  }
}
