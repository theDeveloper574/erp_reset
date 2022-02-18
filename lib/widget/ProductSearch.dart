import 'package:flutter/material.dart';

class Productisedit extends StatefulWidget {
  bool isedit;
  Productisedit(this.isedit);

  @override
  _ProductiseditState createState() => _ProductiseditState();
}

class _ProductiseditState extends State<Productisedit> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.isedit = !widget.isedit;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Image(
            image: widget.isedit == false
                ? AssetImage("asset/grid_view_ic.png")
                : AssetImage("asset/list_view_ic.jpeg")),
      ),
    );
  }
}
