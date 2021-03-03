import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Center(
        child: Container(
          height: 50,
          width: 350,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'CONFIRM',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFd0b67f),
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
