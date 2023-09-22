import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './pages/database.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 165, 165, 165)),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      );
    } else {
      return const CupertinoApp(
        title: 'Flutter Demo on IOS',
        theme: CupertinoThemeData(
            primaryColor: Color.fromARGB(255, 0, 0, 0),
            primaryContrastingColor: Color.fromARGB(255, 165, 165, 165)),
        home: MyIosHomePage(title: 'Flutter Demo Home Page on IOS'),
      );
    }
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.x
      persistentFooterButtons: [
        ElevatedButton(
            onPressed: _decrementCounter,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.amber)),
            child: const Icon(
              Icons.remove,
              color: Colors.black,
            )),
        ElevatedButton(
            onPressed: _incrementCounter, child: const Icon(Icons.add)),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DatabasePage()),
              );
            },
            child: const Text('Go to Database Page')),
      ],
    );
  }
}

class MyIosHomePage extends StatefulWidget {
  const MyIosHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyIosHomePage> createState() => _MyIosHomePageState();
}

class _MyIosHomePageState extends State<MyIosHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      backgroundColor: Colors.red,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Theme.of(context).canvasColor,
        middle: Text(widget.title),
      ),
      child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            const Text(
              'You have pushed the button this many times IOS:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Expanded(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      child: Row(children: <Widget>[
                        Expanded(
                            child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: CupertinoButton(
                                        padding: const EdgeInsets.all(10),
                                        onPressed: _incrementCounter,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        child: const Text("Increment"))))),
                        Expanded(
                            child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: CupertinoButton(
                                        padding: const EdgeInsets.all(10),
                                        onPressed: _decrementCounter,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        child: const Text("Decrement")))))
                      ]),
                    )))
          ])),
      // This trailing comma makes auto-formatting nicer for build methods.x
    );
  }
}
