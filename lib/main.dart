import 'package:example_flutter_app/pages/main_page.dart';
import 'package:example_flutter_app/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  /// This is a way of utilising providers for state management in an app.
  /// State management is important and something to think about how you are going to manage before starting the project.
  /// Without state management data can be lost when switching between screens.
  ///
  /// Usually the default setup here is just:
  ///
  /// runApp(const MyApp());
  ///
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Example App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}
