import 'package:mad_project/UI/club_admin.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/UI/userProfile23.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mad_project/UI/home_screen.dart';
import 'package:mad_project/UI/add_post.dart';
import 'package:mad_project/UI/add_event_screen.dart';
import 'package:mad_project/widgets/custom_tab_bar.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
    final List<Widget> _screens = [

    HomeScreen(),
      AdminPage(),
    AddPost(),
    AdminViewClub(clubName: "Drama cleub",description: "desc",imgUrl: "https://www.nsbm.ac.lk/wp-content/uploads/2019/08/footer_logo.png",),
      AdminEventScreen(),

  ];
    final List<IconData> _icons = const [
//    Icons.flag,
      Icons.person,
      Icons.home,
      MdiIcons.plus,
      Icons.people,
      Icons.event,

  ];

//  final List<Color> _colors = const[
//    Colors.red,
//    Colors.blue,
//    Colors.green,
//    Colors.purple,
//    Colors.purple
//  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        // body: _screens[_selectedIndex],
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(bottom: 12.0),
          color: Colors.white,
          child: CustomTabBar(
            icons: _icons,
            
            selectedIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
          ),
        ),
      ),
    );
  
  }
}