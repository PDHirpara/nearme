import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Auth/Login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    home: Login(),
  ));
}
