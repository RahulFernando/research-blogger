import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/rate.dart';

StreamBuilder<QuerySnapshot<Object?>> reusableCommentSectionList(String relatedPostId) {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _collectionReference =
  _firestore.collection("ratings");

  final Stream<QuerySnapshot> _comments = _collectionReference.where(
      "relatedPost", isEqualTo: relatedPostId).snapshots();

  return StreamBuilder<QuerySnapshot>(
      stream: _comments,
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return const Text('Something went wrong');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }

      return ListView(
        children: snapshot.data!.docs.map((DocumentSnapshot document) {
          var data = Rate.fromDocumentSnapshot(document as DocumentSnapshot<Map<String, dynamic>>);

          return Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(data.comment as String),
                        Text('${data.rate}'),
                      ],
                    ),
                  ),
                ),
          );
        }).toList(),
      );
    },
  );
}