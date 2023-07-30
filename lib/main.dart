import 'package:flutter/material.dart';
import 'package:ui_task/post_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme(),
      themeMode: ThemeMode.light,
      home: const PostDetailsPage(),
    );
  }
}


ThemeData lightTheme() {
  var baseTheme = ThemeData.light();
  baseTheme.textTheme.apply(fontFamily: 'NotoSans');
  baseTheme.copyWith(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: baseTheme.colorScheme.copyWith(
        primary: Colors.white,
        secondary: Colors.white,
        onSecondary: Colors.white,
      ));

  return baseTheme;
}
