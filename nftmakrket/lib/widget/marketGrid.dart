import 'package:flutter/material.dart';

import '../Colors/colors.dart';

class MarketGrid extends StatelessWidget {
  final String _name;
  final String _photo;

  MarketGrid(
    this._name,
    this._photo,
  );

  @override
  Widget build(BuildContext context) {
    backgroundColor:
    MaterialStateProperty.all(Theme.of(context).errorColor);
    return Scaffold(
      body: SizedBox(
        height: 200,
        child: Card(
          color: first,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Image.network(_photo, width: 200, height: 100),
              ),
              Container(child: Text(_name)),
            ],
          ),
        ),
      ),
    );
  }
}
