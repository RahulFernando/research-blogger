import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/article.dart';
import '../models/idea.dart';
import '../models/research.dart';

StreamBuilder<QuerySnapshot<Object?>> reusableIdeaResearchListView(
    String collection, bool? byUser) {
  var uid = FirebaseAuth.instance.currentUser?.uid;
  final Stream<QuerySnapshot> _stream = byUser == true
      ? FirebaseFirestore.instance
          .collection(collection)
          .where("uid", isEqualTo: uid)
          .snapshots()
      : FirebaseFirestore.instance.collection(collection).snapshots();

  return StreamBuilder<QuerySnapshot>(
    stream: _stream,
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return const Text('Something went wrong');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }

      return ListView(
        children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Idea idea = Idea(description: "", uid: "");
          Research research = Research(category: "", description: "", uid: "");

          if (collection == "ideas") {
            idea = Idea.fromDocumentSnapshot(
                document as DocumentSnapshot<Map<String, dynamic>>);
          }

          if (collection == "researches") {
            research = Research.fromDocumentSnapshot(
                document as DocumentSnapshot<Map<String, dynamic>>);
          }

          var text =
              collection == "ideas" ? idea.description : research.description;

          return Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                elevation: 10,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(text),
                    ),
                  ],
                ),
              ));
        }).toList(),
      );
    },
  );
}

StreamBuilder<QuerySnapshot<Object?>> reusableArticleListView(
    String collection, bool? byUser) {
  final Stream<QuerySnapshot> _stream = byUser == true
      ? FirebaseFirestore.instance
          .collection(collection)
          .where("uid", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .snapshots()
      : FirebaseFirestore.instance.collection(collection).snapshots();

  return StreamBuilder<QuerySnapshot>(
    stream: _stream,
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return const Text('Something went wrong');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }

      return ListView(
        children: snapshot.data!.docs.map((DocumentSnapshot document) {
          var data = Article.fromDocumentSnapshot(
              document as DocumentSnapshot<Map<String, dynamic>>);

          return Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                elevation: 10,
                child: Column(
                  children: [
                    Image.network(data.image as String),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(data.description),
                    ),
                  ],
                ),
              ));
        }).toList(),
      );
    },
  );
}
