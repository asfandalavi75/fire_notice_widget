import 'package:flutter/material.dart';
import '../classes/feed.dart';
import 'package:google_fonts/google_fonts.dart';

class RiskLevelWidget extends StatelessWidget {
  const RiskLevelWidget({Key? key, this.dist}) : super(key: key);
  final dist;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    String level = calcRisk(dist);
    return Column(
      children: [
        Container(
          width: screenHeight * 0.135,
          height: screenHeight * 0.135,
          margin: const EdgeInsets.fromLTRB(0, 10, 35, 10),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 4, color: Colors.white)),
          child: Center(
            child: Text(
              level,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(right: 35),
          child: Text(
            (dist.toInt()).toString() + " Miles Away",
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

String calcRisk(double riskCheck) {
  if (riskCheck < 50) {
    return "High\nRisk";
  } else if (50 < riskCheck && riskCheck < 100) {
    return "Medium\nRisk";
  } else {
    return "Low\nRisk";
  }
}
