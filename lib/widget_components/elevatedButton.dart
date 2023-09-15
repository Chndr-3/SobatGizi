import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key, this.label, this.color, this.logo, this.textColor, required this.onPressed})
      : super(key: key);
  final Color? textColor;
  final String? logo;
  final String? label;
  final Color? color;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: color, minimumSize: Size(double.infinity, 50),elevation: 8),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (logo != null) ? Image.asset(logo ?? "",scale: 5,) : SizedBox(),
            SizedBox(width: 10,),
            Text(label?? "", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: textColor ?? Colors.white ),)
          ],
        ));
  }
}
