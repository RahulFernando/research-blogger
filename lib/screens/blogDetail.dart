import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colorUtils.dart';

class BlogDetail extends StatefulWidget {
  final String docId;
  final String type;

  const BlogDetail({Key? key, required this.docId, required this.type})
      : super(key: key);

  @override
  State<BlogDetail> createState() => _BlogDetailState();
}

class _BlogDetailState extends State<BlogDetail> {
  bool isRead = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail",
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
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Author",
                          style: GoogleFonts.ptSans(
                              fontSize: 20.0, color: Colors.black)),
                      ElevatedButton(onPressed: () {}, child: const Text("View Profile")),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  widget.type == "article"
                      ? Image.network(
                          "https://cdn.pixabay.com/photo/2020/05/09/13/29/photographer-5149664_960_720.jpg")
                      : Container(),
                  Text("Description",
                      style: GoogleFonts.ptSans(
                          fontSize: 16.0, color: Colors.black)),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Mark as read", style: GoogleFonts.ptSans(
                          fontSize: 17.0, color: Colors.black)),
                      Checkbox(
                        value: isRead,
                        onChanged: (bool? newVal) => setState(() {
                          isRead = newVal!;
                        }),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
