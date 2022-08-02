import 'package:flutter/material.dart';
import '../classes/feed.dart';
import './risk_level_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class RiskFlagWidget extends StatelessWidget {
  const RiskFlagWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    Feed test = generateFeedInst();
    return Container(
      height: screenHeight * 0.5,
      color: Colors.red,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(3, (screenHeight * 0.05), 20, 0),
            child: Column(
              children: [
                Text(
                  test.title.toString(),
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600,
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    color: Colors.white,
                  ),
                ),
                Text(
                  test.updatedDate.toString(),
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: Colors.white,
                  ),
                ),
                RiskLevelWidget(dist: test.distance),
                Text(
                  (test.distance!.toInt()).toString() + " Miles Away",
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).size.width * 0.048,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.white,
                    ),
                    Text(
                      "Evacuation Notice",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w500,
                        fontSize: MediaQuery.of(context).size.width * 0.048,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(1),
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(51, 51, 51, 1),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: screenHeight * 0.12,
                height: screenHeight * 0.12,
              ),
              Container(
                margin: EdgeInsets.all(1),
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(51, 51, 51, 1),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: screenHeight * 0.12,
                height: screenHeight * 0.12,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(1),
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(51, 51, 51, 1),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: screenHeight * 0.12,
                height: screenHeight * 0.12,
              ),
              Container(
                margin: EdgeInsets.all(1),
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(51, 51, 51, 1),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: screenHeight * 0.12,
                height: screenHeight * 0.12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
