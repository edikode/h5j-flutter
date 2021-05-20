import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stikes_h5j/core/consts.dart';

class KankerPage extends StatefulWidget {
  @override
  _KankerPageState createState() => _KankerPageState();
}

class _KankerPageState extends State<KankerPage> {
  List _items = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["kanker"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
                                              'assets/images/kanker.svg',
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
                                        Text('Pengertian\n Kanker',
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
