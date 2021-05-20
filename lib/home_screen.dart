import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'core/consts.dart';
import 'pages/cemas_page.dart';
import 'pages/h5j_page.dart';
import 'pages/hamilton_page.dart';
import 'pages/kanker_page.dart';
import 'pages/non_page.dart';
import 'pages/pengobatan_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // to get size

    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 30, left: 10, right: 10),
              child: Column(
                children: <Widget>[
                  Text('Mobile\n Application H5J',
                      style: TextStyle(
                          fontSize: 30,
                          color: AppColors.backColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                      textAlign: TextAlign.center),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  Expanded(
                    child: GridView.count(
                      crossAxisSpacing: 2,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => KankerPage(),
                              ),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35)),
                            elevation: 4,
                            margin: EdgeInsets.all(15),
                            color: AppColors.mainColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/images/kanker.svg',
                                  height: 80,
                                ),
                                Text(
                                  'PENGERTIAN\nKANKER',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        //..........Pengobatan
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => PengobatanPage(),
                              ),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35)),
                            elevation: 4,
                            margin: EdgeInsets.all(15),
                            color: AppColors.backColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/images/pengobatan.svg',
                                  height: 90,
                                ),
                                Text(
                                  'PENGOBATAN',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        //............Cemas
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => CemasPage(),
                              ),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35)),
                            elevation: 4,
                            margin: EdgeInsets.all(15),
                            color: AppColors.backColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/images/cemas.svg',
                                  height: 80,
                                ),
                                Text(
                                  'CEMAS',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        //...........NON
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => NonPage(),
                              ),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35)),
                            elevation: 4,
                            margin: EdgeInsets.all(15),
                            color: AppColors.mainColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/images/non.svg',
                                  height: 90,
                                ),
                                Text(
                                  'NON FARMAKOLOGI',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        //.........H5J.
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => H5jPage(),
                              ),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35)),
                            elevation: 4,
                            margin: EdgeInsets.all(15),
                            color: AppColors.mainColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/images/h5j.svg',
                                  height: 90,
                                ),
                                Text(
                                  'HIPNOTIS 5 JARI',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        //.........HAMILTON
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => HamiltonPage(),
                              ),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35)),
                            elevation: 4,
                            margin: EdgeInsets.all(15),
                            color: AppColors.backColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/images/rating.svg',
                                  height: 80,
                                ),
                                Text(
                                  'HAMILTON ANXIENTY\n       RATING SCALE',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        //..................................
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
