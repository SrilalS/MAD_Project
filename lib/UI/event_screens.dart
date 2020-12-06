import 'package:mad_project/config/palette.dart';
import 'package:mad_project/models/models.dart';
import 'package:mad_project/widgets/club_header.dart';

import 'package:mad_project/widgets/event_container.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/data/data.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
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
      body: CustomScrollView(slivers: [
        // SliverToBoxAdapter(
        //   child:ClubHeader(currentUser:currentUser),
        // ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final Post post = posts[index];
              return EventContainer(post: post);
            },
            childCount: posts.length,
          ),
        )
      ]),
    );
  }
}
