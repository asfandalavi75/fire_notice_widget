import 'package:flutter/material.dart';
import '../classes/feed.dart';
import 'package:google_fonts/google_fonts.dart';

class RiskLevelWidget extends StatelessWidget {
  const RiskLevelWidget({Key? key, this.dist}) : super(key: key);
  final dist;

  @override
  Widget build(BuildContext context) {
    String level = calcRisk(dist);
    return Container(
      width: MediaQuery.of(context).size.height * 0.12,
      height: MediaQuery.of(context).size.height * 0.12,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 6, color: Colors.white)),
      child: Center(
          child: Text(
        level,
        style: GoogleFonts.lato(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      )),
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
