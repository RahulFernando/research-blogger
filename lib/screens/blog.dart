import 'package:flutter/material.dart';

import '../constants.dart';
import '../utils/colorUtils.dart';
import '../widgets/BlogList.dart';

class Blog extends StatefulWidget {
  const Blog({Key? key}) : super(key: key);

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  // sorting options
  var sortingOptions = ["Idea", "Research", "Article"];
  String selectedOption = "Idea";

  final List<String> items = ["Test 1", "Test 2", "Test 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Blog",
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, ADD_BLOG_SCREEN);
        },
        child: const Icon(Icons.add_outlined),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Column(
          children: [
            DropdownButton(
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
                  ? reusableIdeaResearchListView(selectedOption == "Research"
                      ? '${selectedOption.toLowerCase()}es'
                      : '${selectedOption.toLowerCase()}s', true)
                  : reusableArticleListView('${selectedOption.toLowerCase()}s', true),
            ),
          ],
        ),
      ),
    );
  }

  ListView articleListView() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            elevation: 10,
            child: Column(
              children: [
                Image.network(
                    "https://cdn.pixabay.com/photo/2018/04/13/11/17/paper-3316269_960_720.jpg"),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here',"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
