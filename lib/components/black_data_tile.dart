import 'package:flutter/material.dart';

class BlackDataTile extends StatefulWidget {
  BlackDataTile({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  State<BlackDataTile> createState() => _BlackDataTileState();
}

class _BlackDataTileState extends State<BlackDataTile> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(0, 3, 3, 3),
      decoration: const BoxDecoration(
          color: Color.fromRGBO(51, 51, 51, 1),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: widget.child,
    );
  }
}
