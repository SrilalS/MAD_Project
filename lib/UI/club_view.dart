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
                "https://images.template.net/wp-content/uploads/2014/11/Natural-Facebook-Cover-Photo.jpg"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 80),
                CircleAvatar(
                  radius: 58,
                  // ignore: todo
                  // TODO: Add avatar here
                  backgroundImage: NetworkImage(
                      "https://images.askmen.com/1080x540/2016/01/25-021526-facebook_profile_picture_affects_chances_of_getting_hired.jpg"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
