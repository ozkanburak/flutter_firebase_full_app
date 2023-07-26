import 'package:flutter/material.dart';

enum IconConstants {
  microphone('ic_micropone'),
  appIcon('ic_app_logo')
  ;

  final String value;
  const IconConstants(this.value);

  String get toPng => 'assets/icon/$value.png';
  Image get toImage => Image.asset(toPng);
  }