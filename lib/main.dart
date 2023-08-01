import 'dart:convert';
import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _controller;
  late List<String> items = [];
  late String text = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> readJson(search) async {
    String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);

    final result = data
        .where((map) => map["models"].contains(search) ? true : false)
        .toList();
    // if (!result.isNull) {
    //   List<dynamic> honda = result[0]["models"];
    //   print("result");

    //   print(honda);
    // }

    // final List<String> getData = [];
    // if (result != []) {
    //   items = result[0]['models'];
    // }
    // print(getData);

    setState(() {});
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
          children: [
            const Text("Car Search"),
            TextField(
              onChanged: (value) {
                readJson(value);
                // setState(() {
                //   text = value;
                // });
              },
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Input',
              ),
            ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: items.length,
            //     itemBuilder: (BuildContext context, int index) =>
            //         Text(items[index]),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
