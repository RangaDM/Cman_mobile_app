import 'package:c_man_mobapp/utils/util_function.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CmanProfile extends StatefulWidget {
  final String uid;

  const CmanProfile({Key? key, required this.uid}) : super(key: key);

  @override
  State<CmanProfile> createState() => _CmanProfileState();
}

class _CmanProfileState extends State<CmanProfile> {
  // final double profileHeight = 144;
  var userData = {};
  int postLength = 0;
  int followersLength = 0;
  int followingLength = 0;
  bool _isLoadnig = false;

  //to check if we are following the user or not
  bool isFollowing = false;
  //function to create the coloum
  Column userStatsColoum({required int number, required String lable}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number.toString(),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
        ),
        Text(
          lable,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
      ],
    );
  }

  getUserData() async {
    setState(() {
      _isLoadnig = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .get();
      userData = userSnap.data()!;

      //getthe posts links
      var postSnap = await FirebaseFirestore.instance
          .collection('posts')
          .where('uid', isEqualTo: widget.uid)
          .get();

      postLength = postSnap.docs.length;
      followersLength = userData['followers'].length;
      followingLength = userData['following'].length;
      //check if we are following the user or not
      isFollowing = userData['followers']
          .contains(FirebaseAuth.instance.currentUser!.uid);
      //update the ui this is a must so we can see the changes
      // telling Flutter that the internal state of the widget has changed and that the UI should be rebuilt to reflect this change.
      setState(() {});
      setState(() {
        _isLoadnig = false;
      });
    } catch (error) {
      showSnakBar(context, error.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        buidTop(),
        buildContent(),
      ],
    ));
  }
}

Widget buildContent() => Column(
      children: [
        const SizedBox(height: 8),
        const Text('Ranga Dana',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        const Text('1.5K Followers',
            style: TextStyle(fontSize: 16, color: Colors.grey)),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSocialIcon(FontAwesomeIcons.youtube),
            const SizedBox(width: 12),
            buildSocialIcon(FontAwesomeIcons.whatsapp),
            const SizedBox(width: 12),
            buildSocialIcon(FontAwesomeIcons.phone),
          ],
        ),
        const SizedBox(height: 16),
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  'Flutter is nice machaan',
                  style: TextStyle(fontSize: 18, height: 1.4),
                ),
              ],
            ),
          ),
        ),
      ],
    );

Widget buildSocialIcon(IconData icon) => CircleAvatar(
      radius: 25,
      child: Material(
          shape: CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Center(child: Icon(icon, size: 32)),
          )),
    );

Widget buidTop() {
  return Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.center,
    children: [
      Container(
        margin: EdgeInsets.only(bottom: 72),
        child: buidCoverImage(),
      ),
      Positioned(
        top: 208,
        child: buidProPic(),
      )
    ],
  );
}

Widget buidCoverImage() => Container(
      color: Colors.black,
      child: Image.network(
        "https://images.unsplash.com/photo-1474552226712-ac0f0961a954?q=80&w=871&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        width: double.infinity,
        height: 280,
        fit: BoxFit.cover,
      ),
    );

Widget buidProPic() => CircleAvatar(
      radius: 72,
      backgroundColor: Colors.grey.shade800,
      backgroundImage: NetworkImage(
        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ),
    );
