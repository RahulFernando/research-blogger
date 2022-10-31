import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:research_blogger/models/idea.dart';
import 'package:research_blogger/models/research.dart';
import 'package:research_blogger/widgets/Button.dart';

import '../service/ideaService.dart';
import '../service/researchService.dart';
import '../utils/colorUtils.dart';

class AddBlog extends StatefulWidget {
  const AddBlog({Key? key}) : super(key: key);

  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  // controller
  final TextEditingController _ideaController = TextEditingController();
  final TextEditingController _researchController = TextEditingController();

  bool isLoading = false;
  String profession = "Researcher";

  // professions
  var professions = ["Researcher", "Student"];

  @override
  Widget build(BuildContext context) {
    // TabController tabController = TabController(length: 3, vsync: this);

    return DefaultTabController(
        length: 3,
        child: Scaffold(
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
            bottom: const TabBar(indicatorColor: Colors.white, tabs: [
              Tab(
                child: Text(
                  "Idea",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  "Research",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  "Article",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ]),
          ),
          body: TabBarView(children: [ideaTab(), researchTab()]),
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

  Container researchTab() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            DropdownButton(
              value: profession,
              items: professions.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              icon: const Icon(Icons.keyboard_arrow_down),
              onChanged: (String? newVal) {
                setState(() {
                  profession = newVal!;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
                controller: _researchController,
                maxLines: 8,
                decoration: InputDecoration(
                  hintText: "Type here...",
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
                : reusableButton(context, "Upload", () async {
                    setState(() {
                      isLoading = true;
                    });
                    var response = await ResearchService.create(
                        Research(category: profession, description: _researchController.text));

                    if (response.status == 201) {
                      setState(() {
                        isLoading = false;
                        _researchController.text = "";
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
      ),
    );
  }
}
