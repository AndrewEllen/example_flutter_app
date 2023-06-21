import 'package:example_flutter_app/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            ///Spacer evenly spaces out widgets in a column or other similar list widgets
            const Spacer(),

            const Text(
              "This counter DOESN'T use State Management.",
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                /// You can also use Colors.black or Color.fromRGBO() or Color.fromARGB()
                foregroundColor: Theme.of(context).colorScheme.inverseSurface,
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              ),
              onPressed: _incrementCounter,
              child: Text("Add to Counter"),
            ),

            ///Spacer evenly spaces out widgets in a column or other similar list widgets
            const Spacer(),

            const Text(
              'This counter DOES use State Management.',
            ),
            Text(

              /// This is reading the value of the variable from the provider. Since this widget needs updated when the state changes
              /// we are using context.watch instead of context.read.
              /// Watch rebuilds the widget to update the value while read only reads from the provider.

              '${context.watch<CounterProvider>().counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                /// You can also use Colors.black or Color.fromRGBO() or Color.fromARGB()
                foregroundColor: Theme.of(context).colorScheme.inverseSurface,
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              ),

              /// This is running the updateCounter() function in the provider which is updating the variable
              onPressed: () => context.read<CounterProvider>().updateCounter(),
              child: Text("Add to Counter"),
            ),

            ///Spacer evenly spaces out widgets in a column or other similar list widgets
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
