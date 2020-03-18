import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Widget child;
  final VoidCallback onPressed;

  const PrimaryButton({
    this.text,
    this.child,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 42.0,
      child: RaisedButton(
        elevation: 5.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
        color: Colors.lightBlueAccent,
        child: child == null ?
        Text(
            text,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )
        ) :
        child,
        onPressed: onPressed,
      ),
    );
  }

}