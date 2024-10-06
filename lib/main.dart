import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'movie_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  await Hive.initFlutter(); // Initialize Hive
  await Hive.openBox('movies'); // Open the Hive box for storing movies
  runApp(const ProviderScope(child: MyApp())); // Run the app with ProviderScope
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MoviesPage(), // Set the home page to MoviesPage
    );
  }
}
