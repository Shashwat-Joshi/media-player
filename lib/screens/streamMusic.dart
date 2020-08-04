import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import '../data/userData.dart';
import '../data/musicData.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/playOnlineMusic.dart';

class StreamMusic extends StatefulWidget {
  @override
  _StreamMusicState createState() => _StreamMusicState();
}

class _StreamMusicState extends State<StreamMusic> {
  formatter(int i) {
    String value = musicNames[i];
    if (value.length > 40) {
      value = value.substring(0, 41);
      value = value + ".......";
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: GradientAppBar(
        elevation: 0.0,
        title: Text(
          "Music Stream",
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          //alignment: Alignment.topCenter,
          height: size.height + 1300.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
                width: size.width,
                child: Text(
                  "$greetingMessage,\nShashwat",
                  style: GoogleFonts.dmSans(
                    fontSize: 35.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
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
                        '"Stream Online\nListen Anytime\nAnywhere"',
                        style: TextStyle(
                          fontSize: 30.0,
                          foreground: Paint()..shader = linearGradient,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 20.0)),
                      Image.asset("assets/icon.png"),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Divider(
                thickness: 1.0,
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                width: size.width,
                child: Text(
                  "All songs",
                  style: GoogleFonts.dmSans(
                    fontSize: 30.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: musicNames.length,
                    itemBuilder: (BuildContext context, int i) =>
                        GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => PlayOnlineMusic(i),
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
                          child: Row(
                            children: <Widget>[
                              Padding(padding: EdgeInsets.only(right: 10.0)),
                              CircleAvatar(
                                radius: 28.0,
                                child: Image.asset("assets/mus.png"),
                              ),
                              Padding(padding: EdgeInsets.only(right: 10.0)),
                              Text(
                                formatter(i),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

final Shader linearGradient = LinearGradient(
  colors: <Color>[Color(0xFF2468FB), Color(0xFFAB1FD9)],
).createShader(Rect.fromLTWH(0.0, 0.0, 250.0, 200.0));
