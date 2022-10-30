import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:research_blogger/models/idea.dart';
import 'package:research_blogger/widgets/Button.dart';

import '../service/ideaService.dart';
import '../utils/colorUtils.dart';

class AddBlog extends StatefulWidget {
  const AddBlog({Key? key}) : super(key: key);

  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> with TickerProviderStateMixin {
  // controller
  final TextEditingController _ideaController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New Post",
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
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            "Add New Post",
            style: GoogleFonts.ptSans(fontSize: 22.0, color: Colors.black),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blue,
                ),
                controller: tabController,
                isScrollable: true,
                labelPadding: const EdgeInsets.symmetric(horizontal: 30),
                tabs: const [
                  Tab(
                    child: Text(
                      "Idea",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Research",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Article",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                ideaTab(),
                Text("2"),
                Text("3"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container ideaTab() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          TextField(
              controller: _ideaController,
              maxLines: 8,
              decoration: InputDecoration(
                hintText: "Insert your innovative idea...",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: const BorderSide(
                        width: .8,
                        style: BorderStyle.solid,
                        color: Colors.blue)),
              )),
          const SizedBox(
            height: 10,
          ),
          isLoading
              ? const CircularProgressIndicator()
              : reusableButton(context, "Add", () async {
                  setState(() {
                    isLoading = true;
                  });
                  var response = await IdeaService.create(
                      Idea(description: _ideaController.text));

                  if (response.status == 201) {
                    setState(() {
                      isLoading = false;
                      _ideaController.text = "";
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(response.message as String),
                      backgroundColor: Colors.green,
                      duration: const Duration(seconds: 3),
                    ));
                  }

                  if (response.status == 500) {
                    setState(() {
                      isLoading = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(response.message as String),
                      backgroundColor: Colors.redAccent,
                      duration: const Duration(seconds: 3),
                    ));
                  }
                }, null, null),
        ],
      ),
    );
  }
}
