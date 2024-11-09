import 'package:flutter/material.dart';
import 'package:flutter_navigation_drawer/about_page.dart';
import 'package:flutter_navigation_drawer/contact_page.dart';
import 'package:flutter_navigation_drawer/profile_page.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    DrawerItem("Profile", Icons.person),
    DrawerItem("About", Icons.account_box_outlined),
    DrawerItem("Contact", Icons.call),
  ];
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return const ProfilePage();
      case 1:
        return const AboutPage();
      case 2:
        return const ContactPage();

      default:
        return const Text("Error");
    }
  }

  _onSelectedItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(ListTile(
        leading: Icon(d.icon),
        title: Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectedItem(i),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: Text(
          widget.drawerItems[_selectedDrawerIndex].title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              accountName: Text("Md. Najmul Hasan Shihab"),
              accountEmail: Text("hasannajmul559@gmial.com"),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Icon(
                    Icons.person_rounded,
                    size: 60,
                  ),
                ),
              ),
            ),
            Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
