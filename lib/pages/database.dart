import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class DatabasePage extends StatelessWidget {
  const DatabasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      home: const PageScaffoldExample(),
    );
  }
}

class PageScaffoldExample extends StatelessWidget {
  const PageScaffoldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Scaffold Example'),
      ),
      body: const Center(
        child: Text('Page Scaffold Example'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _goback(context);
        },
      ),
    );
  }

  _goback(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const MyHomePage(
                  title: '',
                )));
  }
}

class GetMonodbAtlas extends StatefulWidget {
  const GetMonodbAtlas({Key? key}) : super(key: key);
  @override
  _GetMonodbAtlasState createState() => _GetMonodbAtlasState();
}

class _GetMonodbAtlasState extends State<GetMonodbAtlas> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
