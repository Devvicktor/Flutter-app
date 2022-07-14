import 'package:flutter/material.dart';


class DefaultButton extends StatelessWidget {
  const DefaultButton({super.key,this.text,this.press});
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.blue,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.blue,

        ),

        onPressed: press as void Function()?,
        child: Text(
          text!,
          style:const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,

          ),
        ),
      ),
    );
  }

}