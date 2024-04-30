import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:super_hero_api/client/api_client.dart';
import 'package:super_hero_api/model_classes/super_hero_image.dart';
import 'package:super_hero_api/model_classes/super_hero_powerstats.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  final ApiServiceForImage _apiServiceForImage = ApiServiceForImage();
  final ApiServiceForPowerStats _apiServiceForPowerStats =
      ApiServiceForPowerStats();

  Future<PowerStats>? _futureOfPowerStats;
  Future<SuperHeroImage>? _futureOfImage;
  late TextEditingController _controller;

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

  void _incrementCounter() {
    setState(() {
      String text = _controller.text;
      log('Value : $text');
      _futureOfPowerStats = _apiServiceForPowerStats.fetchPowerStats(text);
      _futureOfImage = _apiServiceForImage.fetchImage(text);
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FutureBuilder(
              future: _futureOfImage,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.network(
                        snapshot.data!.url,
                        fit: BoxFit.fill,
                      ),
                    );
                  } else {
                    return const Text('No Image');
                  }
                }
                return const CircularProgressIndicator();
              },
            ),
            FutureBuilder(
              future: _futureOfPowerStats,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return Text('''
                           Name : ${snapshot.data!.name}
                             Intelligence : ${snapshot.data!.intelligence}
                             Strength : ${snapshot.data!.strength}
                             Power : ${snapshot.data!.power}
                             Speed : ${snapshot.data!.speed}
                            
                        ''');
                  } else {
                    return const Text('No Data');
                  }
                }
                return const CircularProgressIndicator();
              },
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: TextField(
                controller: _controller,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
