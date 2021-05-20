import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:stikes_h5j/core/consts.dart';

class H5jPage extends StatefulWidget {
  @override
  _H5jPageState createState() => _H5jPageState();
}

class _H5jPageState extends State<H5jPage> {
  final player = AudioPlayer();
  bool isRunning = false;
  bool visible = false;

  List _items = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["hipnotis"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    player.dispose();
    player.stop();
    super.dispose();
  }

  Future gethipnotis() async {
    await player.setVolume(5.5);
    // await player.setAudioSource(ProgressiveAudioSource(Uri.parse('')));
    await player.setAsset('assets/h5j.mpeg');
    await player.play();
    await player.setLoopMode(LoopMode.off);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: _items.length > 0
                ? Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: _items.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  EdgeInsets.only(top: 30, left: 20, right: 20),
                              child: Column(
                                children: [
                                  Center(
                                    child: Container(
                                      height: 150,
                                      width: 150,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(90)),
                                        elevation: 10,
                                        color: AppColors.mainColor,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            SvgPicture.asset(
                                              'assets/images/h5j.svg',
                                              height: 100,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: <Widget>[
                                        Text('Hipnotis\n 5 Jari',
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: AppColors.backColor,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Poppins'),
                                            textAlign: TextAlign.center),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(35)),
                                      elevation: 4,
                                      color: Colors.white,
                                      margin: EdgeInsets.only(
                                          top: 10,
                                          bottom: 40,
                                          left: 10,
                                          right: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .stretch, // add this
                                        children: <Widget>[
                                          Visibility(
                                            visible: visible,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              child: Image.asset(
                                                  "assets/h5j.gif",
                                                  width: 300,
                                                  height: 300,
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 40),
                                    child: RaisedButton(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 20.0, horizontal: 40.0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      color: AppColors.backColor,
                                      child: Text(
                                        isRunning ? 'STOP' : 'Mulai Hipnotis',
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      onPressed: () {
                                        if (isRunning) {
                                          print("hide");
                                          setState(() {
                                            player.stop();
                                            isRunning = false;
                                            visible = false;
                                          });
                                        } else {
                                          setState(() {
                                            print("show");
                                            player.setVolume(5.5);
                                            player.setAsset('assets/h5j.mpeg');
                                            player.play();
                                            player.setLoopMode(LoopMode.off);
                                            visible = true;
                                            isRunning = true;
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.backColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35),
                                      ),
                                      border: Border.all(color: Colors.white),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          offset: Offset(1, 1),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                        ),
                                      ],
                                    ),
                                    margin: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          contentPadding:
                                              const EdgeInsets.all(25),
                                          subtitle: Text(
                                            _items[index]["text"],
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
