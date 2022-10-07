import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value:  SystemUiOverlayStyle(statusBarColor: Colors.white,
          systemNavigationBarColor: Color.fromRGBO(143, 148, 251, 1),
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
          ),child: SafeArea(
            child: SizedBox(
               child: Center(child: Text("Đay la home Page")),)
    )

    ));
  }

}