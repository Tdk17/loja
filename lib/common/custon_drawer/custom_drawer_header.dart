import 'package:flutter/material.dart';


class CustomDrawerHeader extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 24, 16,8),
      height: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Loja Alto\nAtral',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
