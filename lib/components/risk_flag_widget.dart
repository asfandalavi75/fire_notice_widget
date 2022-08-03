import 'package:flutter/material.dart';
import '../classes/feed.dart';
import './risk_level_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'black_data_tile.dart';

class RiskFlagWidget extends StatelessWidget {
  const RiskFlagWidget({Key? key}) : super(key: key);

  Color _getRiskColor(double? dist) {
    if (dist! < 50) {
      return Colors.red;
    } else if (50 < dist && dist < 100) {
      return Colors.yellow;
    } else {
      return Colors.lightGreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    Feed test = generateFeedInst();
    return Container(
      height: screenHeight * 0.5,
      color: _getRiskColor(test.distance),
      child: Row(
        children: [
          SizedBox(
            width: screenWidth * 0.44,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    // color: Color.fromRGBO(32, 41, 17, 0.4),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 13, bottom: 4),
                      child: Text(
                        test.title.toString(),
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
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
                Expanded(
                  flex: 4,
                  child: Container(
                      padding: EdgeInsets.only(top: 10, right: 10),
                      // color: Color.fromRGBO(32, 41, 197, 0.4),
                      child: RiskLevelWidget(dist: test.distance)),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.only(left: 8),
                    // color: Color.fromRGBO(32, 41, 17, 0.4),
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
                ),
              ],
            ),
          ),

          ///Right Side

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: Container(
                  // color: Color.fromRGBO(32, 41, 17, 0.4),
                  width: screenWidth * 0.56,
                  height: screenHeight * 0.4,
                  child: GridView.count(
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                    crossAxisCount: 2,
                    children: <Widget>[
                      BlackDataTile(),
                      BlackDataTile(),
                      BlackDataTile(),
                      BlackDataTile(),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
