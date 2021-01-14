import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mad_project/UI/ClubList.dart';

class ClubListCats extends StatefulWidget {
  @override
  _ClubListCatsState createState() => _ClubListCatsState();
}

class _ClubListCatsState extends State<ClubListCats> {


 
  FirebaseFirestore fDB = FirebaseFirestore.instance;
  @override
  void initState(){
  
    super.initState();
  
  }

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
              stream: fDB.collection('clubCats').snapshots(),
              builder: (context, clubCats){
                if (clubCats.data != null){
                     return ListView.builder(
                  itemCount: clubCats.data.documents.length,
                  itemBuilder: (context, int index){
                    return Container(
                       margin:const EdgeInsets.all(9),
                        height:140,
                        child: Card(
                          elevation: 8,
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => ClubList(
                                    id: clubCats.data.documents[index]['ID'].toString() ,
                                    name: clubCats.data.documents[index]['Name'].toString(),
                                    imageUrl: "https://www.nsbm.ac.lk/wp-content/uploads/2019/08/footer_logo.png",
                                    )
                                  ));
                            },
                          child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              Text(clubCats.data.documents[index]['ID'].toString() ),
                             // Image.network(clubCats.data.documents[index]['image'].toString()),
                             CachedNetworkImage(
                              fit: BoxFit.fill,
                              //fit: BoxFit.fitHeight,
                               width:Get.width,
                              height: Get.height,
                               imageUrl:clubCats.data.documents[index]['image'].toString() ,
                             ),
                          
                              Container(
                                width:Get.width,
                                height:45,
                                color: Colors.white.withOpacity(0.8),

                              ),

                              ListTile(
                                title: Text(clubCats.data.documents[index]['Name'].toString()   ),
                            
                            ),
                              FlatButton(onPressed:(){
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => ClubList(
                                    id: clubCats.data.documents[index]['ID'].toString() ,
                                     name: clubCats.data.documents[index]['Name'].toString(),
                                    imageUrl:  clubCats.data.documents[index]['image'].toString(),
                                    )
                                  ));
                              },
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