import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

navigateTo(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}
