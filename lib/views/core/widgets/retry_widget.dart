import 'package:flutter/material.dart';

class Retry extends StatelessWidget {
  const Retry({Key key, @required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Something went wrong'),
        SizedBox(
          height: 10,
        ),
        TextButton(onPressed: onPressed, child: Text('Retry'))
      ],
    );
  }
}
