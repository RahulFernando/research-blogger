import 'package:flutter/material.dart';

import '../utils/colorUtils.dart';
import '../widgets/IconButtonBar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedPage = 0;

  final screens = [
    const Center(child: Text("Home"),),
    const Center(child: Text("New"),),
    const Center(child: Text("Profile"),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedPage],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("1488cc"),
              hexStringToColor("2b32b2")
            ])),
        child: BottomAppBar(
          elevation: 0,
          color: Colors.transparent,
          child: SizedBox(
            height: 56,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButtonBar(
                      icon: Icons.home,
                      selected: _selectedPage == 0,
                      onPressed: () {
                        setState(() {
                          _selectedPage = 0;
                        });
                      }),
                  IconButtonBar(
                      icon: Icons.add_circle_outline,
                      selected: _selectedPage == 1,
                      onPressed: () {
                        setState(() {
                          _selectedPage = 1;
                        });
                      }),
                  IconButtonBar(
                      icon: Icons.account_circle,
                      selected: _selectedPage == 2,
                      onPressed: () {
                        setState(() {
                          _selectedPage = 2;
                        });
                      }),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
