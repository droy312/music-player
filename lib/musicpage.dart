import 'package:flutter/material.dart';
import 'package:music_player/home.dart';
import 'package:music_player/music.dart';
import 'package:music_player/resources.dart';

class MusicPage extends StatefulWidget {
  final Music music;

  MusicPage({Key key, this.music}) : super(key: key);

  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  Resources r = new Resources();

  Size ds = Size(0.0, 0.0);

  // ------------- USING -----------------

  Widget neumorphicWidget(Widget child) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        gradient: LinearGradient(
          colors: [
            r.black,
            r.lightBlack,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.white12, offset: Offset(-5, -5), blurRadius: 10),
          BoxShadow(
              color: Colors.black38, offset: Offset(5, 5), blurRadius: 10),
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(6),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          gradient: LinearGradient(
            colors: [
              r.lightBlack,
              r.black,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: child,
      ),
    );
  }

  Widget topBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(  
                builder: (context) => HomePage(),
              ));
            },
                      child: neumorphicWidget(
                Icon(Icons.keyboard_arrow_left, color: r.lightBlack)),
          ),
          Text('PLAYING NOW',
              style: r.style(Colors.white24, 14, r.f1, isBold: true)),
          neumorphicWidget(Icon(Icons.menu, color: r.lightBlack)),
        ],
      ),
    );
  }

  Widget mainImage() {
    return Container(
      height: ds.width - 100,
      width: ds.width - 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(400)),
        color: r.black,
        boxShadow: [
          BoxShadow(
              color: Colors.white12, offset: Offset(-8, -8), blurRadius: 16),
          BoxShadow(
              color: Colors.black38, offset: Offset(8, 8), blurRadius: 16),
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(400)),
          gradient: LinearGradient(
            colors: [
              r.lightBlack,
              r.black,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(400)),
          child: Image.asset('images/img_rose.png', fit: BoxFit.fill),
        ),
      ),
    );
  }

  Widget musicTitle(Music music) {
    return Container(
        child: Column(
      children: <Widget>[
        Text(music.title, style: r.style(Colors.white70, 24, r.f1)),
        Text(music.subTitle, style: r.style(Colors.white24, 18, r.f1)),
      ],
    ));
  }

  Widget sideBtn(Widget child) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        color: Color.fromRGBO(40, 40, 40, 1),
        boxShadow: [
          BoxShadow(
              color: Colors.white12, offset: Offset(-6, -6), blurRadius: 12),
          BoxShadow(
              color: Colors.black38, offset: Offset(6, 6), blurRadius: 12),
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(22),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          gradient: LinearGradient(
            colors: [
              r.lightBlack,
              r.black,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: child,
      ),
    );
  }

  Widget bottomBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          sideBtn(
              Icon(Icons.keyboard_arrow_left, color: Colors.white24, size: 30)),
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              gradient: LinearGradient(
                  colors: [
                    r.red,
                    r.deepRed,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              boxShadow: [
                BoxShadow(
                    color: Colors.white12,
                    offset: Offset(-6, -6),
                    blurRadius: 12),
                BoxShadow(
                    color: Colors.black38,
                    offset: Offset(6, 6),
                    blurRadius: 12),
              ],
            ),
            child: Container(
              padding: EdgeInsets.all(22),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                gradient: LinearGradient(
                  colors: [
                    r.deepRed,
                    r.red,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Icon(Icons.pause, color: Colors.white, size: 30),
            ),
          ),
          sideBtn(
              Icon(Icons.keyboard_arrow_left, color: Colors.white24, size: 30)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ds = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: r.lightBlack,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            topBar(context),
            SizedBox(height: 15),
            mainImage(),
            SizedBox(height: 30),
            musicTitle(widget.music),
            SizedBox(height: 30),
            bottomBar(),
          ],
        ),
      ),
    );
  }
}
