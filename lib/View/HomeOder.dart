import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeOder extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Center(child: Text("Đay la home Odder")),
        ),
      ),
    );
  }

}