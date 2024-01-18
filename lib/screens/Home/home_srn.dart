import 'package:c_man_mobapp/utils/colors.dart';
import 'package:c_man_mobapp/widgets/post_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          title: Image.asset(
            'assets/logoyellow.png',
            height: 40,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.messenger_outline),
            )
          ],
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("posts").snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              //show a circcular indiccatr
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) => PostCard(
                  snap: snapshot.data!.docs[index].data(),
                ),
              );
            }
          },
        ));
  }
}
