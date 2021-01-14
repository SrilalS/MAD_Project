import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mad_project/UI/ViewClub.dart';

class ClubList  extends StatelessWidget {
   final String id;
  final String imageUrl;
  final String name;
  FirebaseFirestore fDB = FirebaseFirestore.instance;



 ClubList({Key key,  this.imageUrl, this.name, this.id}) : super(key: key);


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
//          Container(
//   padding: EdgeInsets.all(10.0),
//   width: MediaQuery.of(context).size.width / 2,
//   height: MediaQuery.of(context).size.height - 430,
//   decoration: BoxDecoration(
//     border: Border.all(color: Colors.white, width: 5),
//     shape: BoxShape.rectangle,
//     color: Colors.white,
//     image: DecorationImage(
//      image: NetworkImage(imageUrl),
//       fit: BoxFit.fill
//     ),
//   ),
// ),
Container(
                        height:150,
                        child: Card(
                          child: InkWell(
                          
                          child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                               CachedNetworkImage(
                              fit: BoxFit.fitHeight,
                               width:Get.width,
                               height: Get.height,
                               imageUrl:imageUrl ,
                             ),

                              Container(
                                width:Get.width,
                                height:45,
                                color: Colors.white.withOpacity(0.9),
                              ),
                               ListTile(
                                title: Text(name, style: TextStyle(fontWeight: FontWeight.bold),   ),
                            
                            ),
                            
                          //  FlatButton(onPressed:(){
                          //       Navigator.push(context, MaterialPageRoute(
                          //         builder: (context) =>ViewClub(clubName: 'Dancing Club',description: 'Description',
                          //         imgUrl: 'https://firebasestorage.googleapis.com/v0/b/mad-project-8569b.appspot.com/o/ClubImages%2Freligious.jpg?alt=media&token=914f6411-1f94-4bea-b5ad-b5242a428b6d',
                          //         ) ,
                          //         ));
                          //     },
                          //    child:Text("view")
                          //    )
                            
                           

                            ]
                          ),
                        )
                    ),
                

                                      
                    ),
        
   //   Image.network(imageUrl),
          Expanded(
            flex:1,
            child: StreamBuilder(
              stream: fDB.collection('clubCats').doc(id).collection('ClubList').snapshots(),
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
                                  builder: (context) =>ViewClub(clubName: 'Dancing Club',description: 'Description',
                                  imgUrl: 'https://firebasestorage.googleapis.com/v0/b/mad-project-8569b.appspot.com/o/ClubImages%2Freligious.jpg?alt=media&token=914f6411-1f94-4bea-b5ad-b5242a428b6d',
                                  ) ,
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
                            
                              FlatButton(onPressed:(){
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => ViewClub(
                                    clubName: clubCats.data.documents[index]['ClubName'].toString(),
                                    description: clubCats.data.documents[index]['description'].toString(),
                                    imgUrl:clubCats.data.documents[index]['image'].toString()) ,
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

// class ClubList extends StatefulWidget {
 
//   final String ID;
//   final String imageUrl;
//   final String name;

//   const ClubList({Key key, this.ID, this.imageUrl, this.name}) : super(key: key);
//   @override
//   _ClubListState createState() => _ClubListState(ID,imageUrl,name);
// }

// class _ClubListState extends State<ClubList> {
//   final String ID;
//    final String imageUrl;
//   final String name;
   
//   FirebaseFirestore fDB = FirebaseFirestore.instance;

//   _ClubListState(this.ID, this.imageUrl, this.name);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:Text("Club List"),
//         backgroundColor: Colors.green,
//         elevation: 0.0,
//       ),
//       body: Column(
//         children:[
// //          Container(
// //   padding: EdgeInsets.all(10.0),
// //   width: MediaQuery.of(context).size.width / 2,
// //   height: MediaQuery.of(context).size.height - 430,
// //   decoration: BoxDecoration(
// //     border: Border.all(color: Colors.white, width: 5),
// //     shape: BoxShape.rectangle,
// //     color: Colors.white,
// //     image: DecorationImage(
// //      image: NetworkImage(imageUrl),
// //       fit: BoxFit.fill
// //     ),
// //   ),
// // ),
        
//       Image.network('https://www.nsbm.ac.lk/wp-content/uploads/2019/08/footer_logo.png'),
//           Expanded(
//             flex:1,
//             child: StreamBuilder(
//               stream: fDB.collection('clubCats').doc(ID).collection('ClubList').snapshots(),
//               builder: (context, clubCats){
//                 if (clubCats.data != null){
//                      return ListView.builder(
//                   itemCount: clubCats.data.documents.length,
//                   itemBuilder: (context, int index){
//                     return Container(
//                         height:150,
//                         child: Card(
//                           child: InkWell(
//                             onTap: (){
//                               Navigator.push(context, MaterialPageRoute(
//                                   builder: (context) =>ViewClub(clubName: 'Dancing Club',description: 'Description',) ,
//                                   ));
//                             },
//                           child: Stack(
//                             alignment: AlignmentDirectional.bottomEnd,
//                             children: [
//                                CachedNetworkImage(
//                               fit: BoxFit.fitWidth,
//                                width:Get.width,
//                                height: Get.height,
//                                imageUrl:clubCats.data.documents[index]['image'].toString() ,
//                              ),

//                               Container(
//                                 width:Get.width,
//                                 height:45,
//                                 color: Colors.white.withOpacity(0.9),
//                               ),

//                               ListTile(
//                                 title: Text(clubCats.data.documents[index]['ClubName'].toString()   ),
                            
//                             ),
                            
//                               //FlatButton(onPressed:(){
//                                 // Navigator.push(context, MaterialPageRoute(
//                                   //builder: (context) => ViewClub(clubName: 'Dancing Club',description: 'Description',) ,
//                                   //));
//                               //},
//                              //child:Text("view")
//                              //)

//                             ]
//                           ),
//                         )
//                     ),
                

                                      
//                     );
//                   },
//                 );
//               }else{
//                return  Center(
//                  child: CircularProgressIndicator(),
//                 );
//               }
//               },
//             ),
//             )
//         ]
//       ),
//     );
//   }  
  
  
// }