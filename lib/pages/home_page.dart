import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          children: [

            Spacer(flex: 8),

            SizedBox(
              width: 300,
              child: Text(
                "When switching between this page and the counter page you will notice that one of the counters doesn't keep its value."
              ),
            ),

            Spacer(flex: 1),

            SizedBox(
              width: 300,
              child: Text(
                  "This is because only one of them is using State Management which is actually storing the data"
              ),
            ),

            Spacer(flex: 8),

          ],
        ),
      ),
    );
  }
}