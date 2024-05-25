import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:responsi/models/favourites.dart';
import 'package:responsi/screens/login.dart';
late Box box;

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(KopisAdapter());
  box = await Hive.openBox<Kopis>('favourites');
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
    );
  }
}
