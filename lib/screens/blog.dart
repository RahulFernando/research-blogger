import 'package:flutter/material.dart';

import '../constants.dart';
import '../utils/colorUtils.dart';

class Blog extends StatefulWidget {
  const Blog({Key? key}) : super(key: key);

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
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
    );
  }
}
