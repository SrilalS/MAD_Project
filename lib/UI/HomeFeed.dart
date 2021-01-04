import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeFeed extends StatefulWidget {
  @override
  _HomeFeedState createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Posts').get().asStream(),
      builder: (context, snapshot){

        if (snapshot.connectionState != ConnectionState.done){
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          //shrinkWrap: true,
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context,index){
            return Container(
              width: Get.width,
              height: 256,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  elevation: 4,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      CachedNetworkImage(
                        fit: BoxFit.cover,
                        width: Get.width,
                        imageUrl: snapshot.data.docs[index]['CoverPhoto'],
                      ),
                      Container(
                        color: Colors.white.withOpacity(0.8),
                        height: 64,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(snapshot.data.docs[index]['Name'], style: titleTexts(Colors.black, FontWeight.bold, 24),),
                          ],
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.blue,
                          onTap: (){
                            print(snapshot.data.docs[index].id);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
