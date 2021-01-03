import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // ignore: todo
            // TODO: Add background here
            Image.network(
                "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.nsbm.ac.lk%2F&psig=AOvVaw3eiX2TAB9ErnLj-0-wGCVd&ust=1609766537261000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLC35-nt_-0CFQAAAAAdAAAAABAD"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 80),
                CircleAvatar(
                  radius: 58,
                  // ignore: todo
                  // TODO: Add avatar here
                  backgroundImage: NetworkImage(
                      "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.nsbm.ac.lk%2Fenroll-now%2F&psig=AOvVaw3eiX2TAB9ErnLj-0-wGCVd&ust=1609766537261000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLC35-nt_-0CFQAAAAAdAAAAABAJ"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
