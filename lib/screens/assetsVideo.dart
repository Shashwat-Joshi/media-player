import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/assetVideoPlayer.dart';

class AssetsVideo extends StatefulWidget {
  @override
  _AssetsVideoState createState() => _AssetsVideoState();
}

class _AssetsVideoState extends State<AssetsVideo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(),
        Padding(padding: EdgeInsets.only(top: 20.0)),
        ListTile(
          title: Text(
            "Dark Trailer",
            style: GoogleFonts.dmSans(
              fontSize: 35.0,
            ),
          ),
          trailing: GestureDetector(
            child: Icon(Icons.exit_to_app),
            onTap: () {
              navigateToVideoPage('darktrailer');
            },
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 20.0)),
        Divider(),
        Padding(padding: EdgeInsets.only(top: 20.0)),
        ListTile(
          title: Text(
            "Mustang Shelby",
            style: GoogleFonts.dmSans(
              fontSize: 35.0,
            ),
          ),
          trailing: GestureDetector(
              child: Icon(Icons.exit_to_app),
              onTap: () {
                navigateToVideoPage('car');
              }),
        ),

        Padding(padding: EdgeInsets.only(top: 20.0)),
        Divider(),
        // AssetVideoPlayer('car'),
      ],
    );
  }

  navigateToVideoPage(String key) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AssetVideoPlayer(key),
      ),
    );
  }
}
