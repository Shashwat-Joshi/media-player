import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import '../data/musicData.dart';

class PlayOnlineMusic extends StatefulWidget {
  int i;
  PlayOnlineMusic(
    this.i,
  );
  @override
  _PlayOnlineMusicState createState() => _PlayOnlineMusicState();
}

class _PlayOnlineMusicState extends State<PlayOnlineMusic> {
  AudioPlayer advancedPlayer = AudioPlayer();
  bool isPlaying;

  @override
  initState() {
    super.initState();
    advancedPlayer.pause();
    isPlaying = true;
    loadMusic();
  }

  Future loadMusic() async {
    advancedPlayer.play(musicUrl(widget.i));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        advancedPlayer.pause();
        Navigator.pop(context);
      },
      child: Scaffold(
        appBar: GradientAppBar(
          leading: GestureDetector(
            child: Icon(Icons.cancel),
            onTap: () {
              advancedPlayer.pause();
              Navigator.pop(context);
            },
          ),
          elevation: 0.0,
          title: Text(
            "Music Player",
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              width: size.width,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: Colors.white.withOpacity(0.2),
                child: Image(
                  image: AssetImage('assets/main.png'),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 40.0)),
            Text(
              "${name[widget.i]}",
              style: GoogleFonts.dmSans(
                fontSize: 26.0,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 50.0)),
            Container(
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0XFF2E22AC), Color(0xFFE34C9D)]),
              ),
              child: MaterialButton(
                shape: CircleBorder(),
                child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  if (isPlaying) {
                    setState(() {
                      isPlaying = false;
                    });
                    advancedPlayer.pause();
                  } else {
                    setState(() {
                      isPlaying = true;
                    });
                    advancedPlayer.resume();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
