import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './ExerciseDetail.dart';
import './component/ExerciseSummary.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const Home(),
      getPages: [
        GetPage(name: '/', page: () => Home()),
        GetPage(name: '/detail/:param', page: () => ExerciseDetail())
      ],
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List groupOfExerciseSummary = [
    {
      'index': 0,
      'date': '2022/02/17',
      'exercises': [
        {'name': '걷기', 'value': '1.6km / 15min'},
        {'name': '스트레칭', 'value': '10min'},
        {'name': '체스트 프레스', 'value': '(avg) 35kg x 5'},
      ],
      'time': '51+'
    },
    {
      'index': 1,
      'date': '2022/02/16',
      'exercises': [
        {'name': '걷기', 'value': '1.6km / 15min'},
        {'name': '스트레칭', 'value': '10min'},
        {'name': '체스트 프레스', 'value': '(avg) 35kg x 5'},
      ],
      'time': '64min'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Logs',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return ExerciseSummary(
                          index: groupOfExerciseSummary[index]['index'],
                          date: groupOfExerciseSummary[index]['date'],
                          exercises: groupOfExerciseSummary[index]['exercises'],
                          time: groupOfExerciseSummary[index]['time']);
                    })),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
