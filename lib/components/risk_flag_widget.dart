import 'package:flutter/material.dart';
import '../classes/feed.dart';
import './risk_level_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'black_data_tile.dart';

class RiskFlagWidget extends StatelessWidget {
  const RiskFlagWidget({Key? key}) : super(key: key);

  Gradient? _getRiskColor(double? dist) {
    if (dist! < 50) {
      return const RadialGradient(
          center: Alignment(-0.509094, 0.05275),
          colors: <Color>[
            Color.fromRGBO(239, 71, 58, 1),
            Color.fromRGBO(203, 45, 62, 1)
          ],
          stops: <double>[
            0.0,
            1.0
          ]);
    } else if (50 < dist && dist < 100) {
      return const RadialGradient(
          center: Alignment(-0.509094, 0.05275),
          colors: <Color>[
            Color.fromRGBO(255, 220, 97, 1),
            Color.fromRGBO(252, 197, 0, 1)
          ],
          stops: <double>[
            0.0,
            1.0
          ]);
    } else {
      return const RadialGradient(
          center: Alignment(-0.509094, 0.05275),
          colors: <Color>[
            Color.fromRGBO(18, 183, 106, 1),
            Color.fromRGBO(2, 122, 72, 1)
          ],
          stops: <double>[
            0.0,
            1.0
          ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    Feed test = generateFeedInst();
    return Container(
      // color: _getRiskColor(test.distance),
      decoration: BoxDecoration(gradient: _getRiskColor(test.distance)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // FIRE TITLE
          Container(
            alignment: Alignment.bottomLeft,
            // color: Color.fromRGBO(32, 41, 17, 0.4),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
              child: Text(test.title.toString(),
                  style: Theme.of(context).textTheme.headline1),
            ),
          ),

          ///CONTAINER ONLY PRESENT FOR TESTING PURPOSES(to see the amount of screen space occupied by a widget)
          Container(
            // color: Color.fromRGBO(52, 231, 207, 0.4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenWidth * 0.44,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ///UPDATED DATE
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 13),
                        // color: Color.fromRGBO(22, 131, 237, 0.4),
                        // margin: EdgeInsets.only(left: 10),
                        child: Text(
                          test.updatedDate.toString(),
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      //RISK CIRCLE WIDGET
                      Container(
                          padding: const EdgeInsets.only(
                            top: 10,
                            right: 10,
                            left: 18,
                          ),
                          // color: Color.fromRGBO(32, 41, 197, 0.4),
                          child: RiskLevelWidget(dist: test.distance)),

                      ///EVACUATION NOTICE TEXT
                      Container(
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.only(left: 18, top: 15),
                        //color: Color.fromRGBO(32, 41, 17, 0.4),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.warning_amber_rounded,
                              color: Colors.white,
                            ),
                            Text(
                              "Evacuation Notice",
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                ///Right Side TILES
                Container(
                  // color: Color.fromRGBO(62, 141, 217, 0.4),
                  width: screenWidth * 0.56,
                  height: screenHeight * 0.28,
                  child: GridView.count(
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                    crossAxisCount: 2,
                    children: <Widget>[
                      BlackDataTile(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text('% Contained',
                                  style: Theme.of(context).textTheme.headline2),
                            ),
                            Text(
                              test.percentContained.toString() + "%",
                            )
                          ],
                        ),
                      ),
                      BlackDataTile(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text('Current Size',
                                  style: Theme.of(context).textTheme.headline2),
                            ),
                            // ignore: prefer_const_constructors
                            Text(
                              "20,000 Acres",
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      // temporary data for display purposes only
                      BlackDataTile(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text('Air Quality',
                                  style: Theme.of(context).textTheme.headline2),
                            ),
                            Text("70")
                          ],
                        ),
                      ),
                      BlackDataTile(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text('Wind',
                                  style: Theme.of(context).textTheme.headline2),
                            ),
                            // temporary data for display purposes only
                            const Icon(
                              Icons.explore,
                              size: 50,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: screenHeight * 0.05,
          )
        ],
      ),
    );
  }
}
