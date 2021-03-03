import 'package:flutter/material.dart';

class PartyDateAppBar extends StatelessWidget {
  const PartyDateAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      centerTitle: true,
      backgroundColor: Colors.grey[50],
      title: Text(
        'Party Date',
        style: TextStyle(fontSize: 24, letterSpacing: 4, color: Colors.black),
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, right: 8, left: 2),
            child: Text(
              'Done',
              style: TextStyle(
                  fontSize: 23, color: Color(0xFFdfb366), letterSpacing: 3),
            ),
          ),
        ),
      ],
    );
  }
}
