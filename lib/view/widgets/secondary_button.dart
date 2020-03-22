import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final Widget child;
  final VoidCallback onPressed;

  const SecondaryButton({
    this.text,
    this.child,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45.0,
      child: RaisedButton(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.black12),
        ),
        color: Colors.white,
        child: child == null ?
          Text(
            text,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black45,
              fontWeight: FontWeight.bold,
            )
          ) :
          child,
        onPressed: onPressed,
      ),
    );
  }

}