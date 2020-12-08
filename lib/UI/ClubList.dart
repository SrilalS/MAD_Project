import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

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
        title:Text("Club Category"),
        backgroundColor: Colors.green,
        elevation: 0.0,
      ),
      body: Column(
        children:[
          Expanded(
            flex:1,
            child: StreamBuilder(
              stream: fDB.collection('clubCats').where('ID',isEqualTo: ID).snapshots(),
              builder: (context, clubCats){
                if (clubCats.data != null){
                     return ListView.builder(
                  itemCount: clubCats.data.documents.length,
                  itemBuilder: (context, int index){
                    return Container(
                        height:150,
                        child: Card(
                          child: InkWell(
                            onTap: (){},
                          child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [

                              Container(
                                width:Get.width,
                                height: 45,
                                color: Colors.blue.withOpacity(0.25),

                              ),

                              ListTile(
                                title: Text(clubCats.data.documents[index]['Name'].toString()   ),
                            
                            ),
                              FlatButton(onPressed:(){},
                             child:Text("view")
                             )

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