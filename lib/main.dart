import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/provider/movie_provider.dart';
import 'package:provider_test/screens/home.dart';

void main() {
  runApp(ChangeNotifierProvider<MovieProvider>(
    child: const MyApp(),
    create: (_) => MovieProvider(), // Create a new ChangeNotifier object
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
        useMaterial3: true
      ),
      home: const Home(),
    );
  }
}

