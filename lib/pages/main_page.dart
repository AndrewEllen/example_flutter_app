import 'package:example_flutter_app/pages/counter_page.dart';
import 'package:example_flutter_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentPageIndex = 0;

  List<Widget> pages = <Widget>[
    HomePage(title: "Home"),
    CounterPage(title: "Counter"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: <Widget>[
          const NavigationDestination(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            /// Flutters inbuilt icons use the above example, for material design icons from the MDI package use the below example.
            icon: Icon(MdiIcons.counter),
            label: "Counter",
          ),
        ],
      ),
      body: pages[currentPageIndex],
    );
  }
}
