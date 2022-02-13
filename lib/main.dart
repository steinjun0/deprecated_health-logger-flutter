import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import './ExerciseDetailPage.dart';
import './class/Exercise.dart';
import './component/ExerciseCard.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('fonts/NotoSansKR/OFL.txt');
    yield LicenseEntryWithLineBreaks(['fonts/NotoSansKR'], license);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme =
        ThemeData(brightness: Brightness.light, fontFamily: 'NotoSansKR');
    return GetMaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.orange,
      // ),
      theme: theme.copyWith(
        scaffoldBackgroundColor: Color(0xfff3f4f6),
        colorScheme: theme.colorScheme.copyWith(
          primary: Color(0xff295c99),
          // secondary: Color(0xffA1C2E3),
          secondary: Color(0xff295c99),
        ),
      ),
      home: const Home(),
      getPages: [
        GetPage(name: '/', page: () => Home()),
        GetPage(name: '/detail/:param', page: () => ExerciseDetailPage())
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
  List groupOfExercise = [
    {
      'index': 0,
      'date': '2022/02/17',
      'exercises': [
        {'name': '걷기', 'value': '1.6km / 15min'},
        {'name': '스트레칭', 'value': '10min'},
        {'name': '체스트 프레스', 'value': '(avg) 35kg x 5'},
      ],
      'time': 51
    },
    {
      'index': 1,
      'date': '2022/02/16',
      'exercises': [
        {'name': '걷기', 'value': '1.6km / 15min'},
        {'name': '스트레칭', 'value': '10min'},
        {'name': '체스트 프레스', 'value': '(avg) 35kg x 5'},
      ],
      'time': 64
    },
    ExerciseGroup(
        2,
        '2022/02/15',
        [
          {'name': '걷기', 'value': '1.6km / 15min'},
          {'name': '스트레칭', 'value': '10min'},
          {'name': '체스트 프레스', 'value': '(avg) 35kg x 5'},
        ],
        72),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '짐펜',
          style: TextStyle(color: Colors.black),
        ),
        // backgroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Color(0xfff3f4f6),
        elevation: 0,
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 4, 8),
          child: Image(
            image: AssetImage('assets/icon/logoIcon.png'),
          ),
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
                      return ExerciseCard(
                          index: groupOfExercise[index]['index'],
                          date: groupOfExercise[index]['date'],
                          exercises: groupOfExercise[index]['exercises'],
                          time: groupOfExercise[index]['time']);
                    })),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/detail/new');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
