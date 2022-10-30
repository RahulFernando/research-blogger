import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:research_blogger/widgets/Button.dart';

class AddBlog extends StatefulWidget {
  const AddBlog({Key? key}) : super(key: key);

  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> with TickerProviderStateMixin {
  // controller
  final TextEditingController _ideaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    return Scaffold(
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
                      width: .8, style: BorderStyle.solid, color: Colors.blue)),
            )
          ),
          const SizedBox(
            height: 10,
          ),
          reusableButton(context, "Add", () {}, null, null),
        ],
      ),
    );
  }
}
