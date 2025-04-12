import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/manger/surah_manager.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const QuranApp());
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SurahManager(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quran App',
        theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: 'Cairo',
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
