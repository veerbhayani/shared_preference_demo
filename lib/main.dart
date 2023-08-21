import 'package:flutter/material.dart';
import 'package:shared_preference_demo/simple_crud_shared_pref_demo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SimpleCrudSharedPrefDemo(),
    );
  }
}
