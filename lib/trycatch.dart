import 'package:flutter/material.dart';

void main() {
  runApp(Test());
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String myMargin = '15';
    double myMarginAsADouble;

    try {
      myMarginAsADouble = double.parse(myMargin);
    } catch (e) {
      print(e);
    }

    void greaterThan10(int n) {
      if (n > 10) {
        throw 'n must be greater than 10';
      }
      print(n);
    }

    return Scaffold(
      body: Container(
        color: Colors.red,
        margin: EdgeInsets.all(myMarginAsADouble ?? 30.0),
      ),
    );
  }
}
