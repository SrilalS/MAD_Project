import 'package:mad_project/config/palette.dart';
import 'package:mad_project/models/models.dart';
import 'package:mad_project/services/database_service.dart';
import 'package:mad_project/widgets/club_header.dart';

import 'package:mad_project/widgets/event_container.dart';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  final String clubName;

  const EventPage({Key key, this.clubName}) : super(key: key);
  @override
  _EventPageState createState() => _EventPageState(clubName);
}

class _EventPageState extends State<EventPage> {
  final String clubName;

  _EventPageState(this.clubName);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Palette.facebookBlue,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text(
            'Events',
            style: const TextStyle(
              color: Palette.nsbmgreen,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
        ),
        body: Column(
          children: [
            ClubHeader(
              clubName: clubName,
            ),
            Expanded(
              flex: 1,
              child: StreamBuilder<List<Post>>(
                stream: DatabaseService().getEventfromclubName(clubName),
                builder: (context, snapshot) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return EventContainer(
                          caption: snapshot.data[index].caption,
                          imageUrl: snapshot.data[index].imageUrl,
                          clubImage: snapshot.data[index].clubImage,
                          clubName: snapshot.data[index].clubName,
                        );
                      });
                },
              ),
            )
          ],
        ));
  }
}
