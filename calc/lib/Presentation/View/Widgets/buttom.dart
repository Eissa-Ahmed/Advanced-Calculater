import 'package:flutter/material.dart';

class Buttom extends StatelessWidget {
  Function()? onTap;
  Color bgColor = Colors.grey.shade300;
  Color itemColor = Colors.black;
  String item;

  Buttom({super.key, required this.item, required this.onTap});
  Buttom.orange({super.key, required this.item, required this.onTap}) {
    bgColor = Colors.deepOrange;
    itemColor = Colors.white;
  }
  Buttom.blue({super.key, required this.item, required this.onTap}) {
    bgColor = Colors.blue;
    itemColor = Colors.white;
  }
  Buttom.red({super.key, required this.item, required this.onTap}) {
    bgColor = Colors.red;
    itemColor = Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      child: Container(
        width: 65,
        height: 65,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
        ),
        child: Text(
          item,
          style: TextStyle(
              color: itemColor, fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
