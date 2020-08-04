import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:mediaPlayer/data/videoData.dart';
import 'package:video_player/video_player.dart';
import '../data/videoData.dart';

class NetworkVideoPlayer extends StatefulWidget {
  int i;
  NetworkVideoPlayer(
    this.i,
  );
  @override
  _NetworkVideoPlayerState createState() => _NetworkVideoPlayerState();
}

class _NetworkVideoPlayerState extends State<NetworkVideoPlayer> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network('${videourl[widget.i]}');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () {
        _controller.pause();
        Navigator.pop(context);
      },
      child: Scaffold(
        appBar: GradientAppBar(
          elevation: 0.0,
          title: Text(
            "Video Stream",
            // style: GoogleFonts.dmSans(),
          ),
          leading: GestureDetector(
            onTap: () {
              _controller.pause();
              Navigator.pop(context);
            },
            child: Icon(Icons.cancel),
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
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Container(
              padding: EdgeInsets.all(7.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey[700],
              ),
              margin: EdgeInsets.all(7.0),
              width: size.width,
              height: (size.height) / 3.5,
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the VideoPlayerController has finished initialization, use
                    // the data it provides to limit the aspect ratio of the video.
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      // Use the VideoPlayer widget to display the video.
                      child: VideoPlayer(_controller),
                    );
                  } else {
                    // If the VideoPlayerController is still initializing, show a
                    // loading spinner.
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 30.0)),
            Text(
              "${videoName[widget.i]}",
              style: GoogleFonts.dmSans(
                fontSize: 26.0,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 30.0)),
            Container(
              width: size.width,
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    color: Color(0xFF2468FB),
                    shape: CircleBorder(),
                    height: 100.0,
                    child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
