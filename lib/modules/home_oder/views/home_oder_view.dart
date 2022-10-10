import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeOder extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Column(
            children: [
              Image.asset("assets/img/mapicon.png"),
              const Center(child: Text("Đay la home Odder")),
            ],
          ),
        ),
      ),
    );
  }

}