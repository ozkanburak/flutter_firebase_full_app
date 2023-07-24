import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase_full_app/firebase_options.dart';

@immutable
class ApplicationStart {
  const ApplicationStart._();
  static Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  } 
}