import 'package:flutter/material.dart';
import 'package:research_blogger/screens/blog.dart';
import 'package:research_blogger/screens/profile.dart';
import 'package:research_blogger/service/userService.dart';

import '../utils/colorUtils.dart';
import '../widgets/BlogList.dart';
import '../widgets/IconButtonBar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedPage = 0;

  final screens = [
    const HomeScreen(),
    const Blog(),
    const Profile(),
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
        ));
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // controller
  final TextEditingController _searchController = TextEditingController();

  // sorting options
  var sortingOptions = ["Idea", "Research", "Article"];
  String selectedOption = "Idea";

  String foundUserId = "";

  onSearchChange(String value) async {
    try {
      var response = await UserService.getUserByName(value);

      if (response.data != null) {
        setState(() {
          foundUserId = response.data.uid;
        });
      }
    } catch (e) {
      setState(() {
        foundUserId = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  hexStringToColor("1488cc"),
                  hexStringToColor("2b32b2")
                ]),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                labelText: "Search by author",
              ),
              onChanged: (String? val) async {
                await onSearchChange(val!);
              },
            ),
            DropdownButton(
              hint: const Text("Sort"),
              value: selectedOption,
              items: sortingOptions.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              icon: const Icon(Icons.keyboard_arrow_down),
              onChanged: (String? newVal) {
                setState(() {
                  selectedOption = newVal!;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: selectedOption == "Idea" || selectedOption == "Research"
                  ? reusableIdeaResearchListHomeView(
                      selectedOption == "Research"
                          ? '${selectedOption.toLowerCase()}es'
                          : '${selectedOption.toLowerCase()}s',
                      foundUserId)
                  : reusableArticleListHomeView(
                      '${selectedOption.toLowerCase()}s', foundUserId),
            ),
          ],
        ),
      ),
    );
  }
}
