import 'package:flutter/material.dart';
import 'package:music_player/music.dart';
import 'package:music_player/musicpage.dart';
import 'package:music_player/resources.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Resources r = new Resources();

  List<Music> musicList = [
    Music(title: 'Ain\'t No Time'),
    Music(title: 'In Her Mouth'),
    Music(title: 'Low Life', subTitle: 'Future The Weekend'),
    Music(title: 'Xanny Family'),
    Music(title: 'Lil Haiti Baby'),
    Music(title: 'Photo Copied'),
    Music(title: 'Seven Rings'),
    Music(title: 'Lie To Me'),
    Music(title: 'Bad Bood'),
  ];

  List<bool> playBtnIsPressed = List.filled(12, false);

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

  Widget topBar() {
    return Container(
      width: ds.width,
      alignment: Alignment.center,
      margin: EdgeInsets.all(20),
      child: Text('EVOL FUTURE',
          style: r.style(Colors.white24, 14, r.f1, isBold: true)),
    );
  }

  Widget mainImage() {
    return Container(
      height: ds.width / 2.3,
      width: ds.width / 2.3,
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
        padding: EdgeInsets.all(6),
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

  Widget header() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          neumorphicWidget(Icon(Icons.favorite, color: Colors.white24)),
          mainImage(),
          neumorphicWidget(Icon(Icons.more_horiz, color: Colors.white24)),
        ],
      ),
    );
  }

  Widget musicCard(BuildContext context, int index) {
    return playBtnIsPressed[index]
        ? FlatButton(
          padding: EdgeInsets.all(0),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MusicPage(music: musicList[index]),
                  ));
            },
            child: Container(
              margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                gradient: LinearGradient(
                  colors: [
                    r.lightBlack,
                    Color.fromRGBO(30, 30, 30, 1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(30, 30, 30, 1),
                      Color.fromRGBO(60, 60, 60, 1),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(musicList[index].title,
                            style: r.style(Colors.white70, 18, r.f1)),
                        Text(musicList[index].subTitle,
                            style: r.style(Colors.white24, 14, r.f1)),
                      ],
                    ),
                    playBtnIsPressed[index]
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                playBtnIsPressed[index] =
                                    !playBtnIsPressed[index];
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(2),
                              alignment: Alignment.centerRight,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
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
                                    offset: Offset(-5, -5),
                                    blurRadius: 10,
                                  ),
                                  BoxShadow(
                                    color: Colors.black38,
                                    offset: Offset(5, 5),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Container(
                                padding: EdgeInsets.all(6),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  gradient: LinearGradient(
                                    colors: [
                                      r.deepRed,
                                      r.red,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Icon(Icons.pause,
                                    color: Colors.white, size: 15),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                playBtnIsPressed[index] =
                                    !playBtnIsPressed[index];
                              });
                            },
                            child: neumorphicWidget(
                              Icon(Icons.play_arrow,
                                  color: Colors.white24, size: 15),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          )
        : Container(
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              gradient: LinearGradient(
                colors: [r.lightBlack, r.lightBlack],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                gradient: LinearGradient(
                  colors: [
                    r.lightBlack,
                    r.lightBlack,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(musicList[index].title,
                          style: r.style(Colors.white70, 18, r.f1)),
                      Text(musicList[index].subTitle,
                          style: r.style(Colors.white24, 14, r.f1)),
                    ],
                  ),
                  playBtnIsPressed[index]
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              playBtnIsPressed[index] =
                                  !playBtnIsPressed[index];
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(2),
                            alignment: Alignment.centerRight,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
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
                                  offset: Offset(-5, -5),
                                  blurRadius: 10,
                                ),
                                BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(5, 5),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: Container(
                              padding: EdgeInsets.all(6),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                gradient: LinearGradient(
                                  colors: [
                                    r.deepRed,
                                    r.red,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Icon(Icons.pause,
                                  color: Colors.white, size: 15),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              playBtnIsPressed[index] =
                                  !playBtnIsPressed[index];
                            });
                          },
                          child: neumorphicWidget(
                            Icon(Icons.play_arrow,
                                color: Colors.white24, size: 15),
                          ),
                        ),
                ],
              ),
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
            topBar(),
            SizedBox(height: 15),
            header(),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: musicList.length,
                itemBuilder: (context, index) => musicCard(context, index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
