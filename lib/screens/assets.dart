import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'xylophone.dart';
import 'assetsVideo.dart';

class Assets extends StatefulWidget {
  @override
  _AssetsState createState() => _AssetsState();
}

class _AssetsState extends State<Assets> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: GradientAppBar(
          title: Text("Assets"),
          centerTitle: true,
          gradient: LinearGradient(
            colors: [Color(0xFF2468FB), Color(0xFFAB1FD9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          bottom: TabBar(
            indicatorColor: Colors.white70,
            tabs: [
              Tab(icon: Icon(Icons.music_note)),
              Tab(icon: Icon(Icons.video_library)),
            ],
          ),
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            Xylophone(),
            AssetsVideo(),
          ],
        ),
        // body: Container(),
      ),
    );
  }
}
