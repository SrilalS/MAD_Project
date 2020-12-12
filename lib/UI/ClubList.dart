import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mad_project/UI/ViewClub.dart';


class ClubList extends StatefulWidget {
 
  final String ID;

  const ClubList({Key key, this.ID}) : super(key: key);
  @override
  _ClubListState createState() => _ClubListState(ID);
}

class _ClubListState extends State<ClubList> {
  final String ID;
   
  FirebaseFirestore fDB = FirebaseFirestore.instance;

  _ClubListState(this.ID);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Club List"),
        backgroundColor: Colors.green,
        elevation: 0.0,
      ),
      body: Column(
        children:[
          Expanded(
            flex:1,
            child: StreamBuilder(
              stream: fDB.collection('clubCats').doc(ID).collection('ClubList').snapshots(),
              builder: (context, clubCats){
                if (clubCats.data != null){
                     return ListView.builder(
                  itemCount: clubCats.data.documents.length,
                  itemBuilder: (context, int index){
                    return Container(
                        height:150,
                        child: Card(
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>ViewClub(clubName: 'Dancing Club',description: 'Description',) ,
                                  ));
                            },
                          child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                               CachedNetworkImage(
                              fit: BoxFit.fitWidth,
                               width:Get.width,
                               height: Get.height,
                               imageUrl:clubCats.data.documents[index]['image'].toString() ,
                             ),

                              Container(
                                width:Get.width,
                                height:45,
                                color: Colors.white.withOpacity(0.9),
                              ),

                              ListTile(
                                title: Text(clubCats.data.documents[index]['ClubName'].toString()   ),
                            
                            ),
                            
                              //FlatButton(onPressed:(){
                                // Navigator.push(context, MaterialPageRoute(
                                  //builder: (context) => ViewClub(clubName: 'Dancing Club',description: 'Description',) ,
                                  //));
                              //},
                             //child:Text("view")
                             //)

                            ]
                          ),
                        )
                    ),
                

                                      
                    );
                  },
                );
              }else{
               return  Center(
                 child: CircularProgressIndicator(),
                );
              }
              },
            ),
            )
        ]
      ),
    );
  }  
  
  
}