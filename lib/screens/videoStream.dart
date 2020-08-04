import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:mediaPlayer/data/videoData.dart';
import '../helpers/onlineVideoStream.dart';

class VideoStream extends StatefulWidget {
  @override
  _VideoStreamState createState() => _VideoStreamState();
}

class _VideoStreamState extends State<VideoStream> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: GradientAppBar(
        elevation: 0.0,
        title: Text(
          "Video Stream",
          // style: GoogleFonts.dmSans(),
        ),
        centerTitle: true,
        gradient: LinearGradient(
          colors: [Color(0xFF2468FB), Color(0xFFAB1FD9)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        // backgroundColor: Colors.purple,
      ),
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 40.0)),
          Container(
            margin: EdgeInsets.only(),
            width: size.width,
            height: (size.height) / 4,
            child: Card(
              color: Colors.white.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '"Music Videos\nStreaming from\nAWS S3"',
                    style: TextStyle(
                      fontSize: 30.0,
                      foreground: Paint()..shader = linearGradient,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 20.0)),
                  Image.asset("assets/cloud.png"),
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Divider(),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Container(
            height: 400.0,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, int i) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => NetworkVideoPlayer(i),
                    ),
                  );
                },
                child: Container(
                  height: 90.0,
                  padding: EdgeInsets.all(2.0),
                  width: size.width,
                  child: Card(
                    color: Colors.white.withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 0.0,
                    child: Center(
                      child: Text(
                        "${videoName[i]}",
                        style: GoogleFonts.dmSans(
                          fontSize: 30.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xFF2468FB), Color(0xFFAB1FD9)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 250.0, 200.0));
}
