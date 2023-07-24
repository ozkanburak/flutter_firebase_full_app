import 'package:flutter/material.dart';
import 'package:flutter_firebase_full_app/feature/home/home_view.dart';
import 'package:flutter_firebase_full_app/product/initialize/app_start_init.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await ApplicationStart.init();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomeView(),
    );
  }
}