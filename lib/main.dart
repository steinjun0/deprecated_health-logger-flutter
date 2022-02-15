import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import './ExerciseDetailPage.dart';
import './component/ExerciseCard.dart';
import 'class/Exercise.dart';

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
          // scaffoldBackgroundColor: Color(0xfff3f4f6),
          colorScheme: theme.colorScheme.copyWith(
            primary: Color(0xff295c99),
            // secondary: Color(0xffA1C2E3),
            secondary: Color(0xff295c99),
          ),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Color(0xff343D4C),
                // displayColor: Colors.red,
              )),
      home: const Home(),
      getPages: [
        GetPage(
          name: '/',
          page: () => Home(),
        ),
        GetPage(
          name: '/detail/:param',
          page: () => ExerciseDetailPage(),
        )
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
  final List<ExerciseGroup> exerciseGroupList = [
    new ExerciseGroup(
        2,
        '2022/02/15',
        [
          new DistanceTimeExercise('걷기', 1.6, 15),
          new TimeExercise('스트레칭', 10),
          new WeightExercise('체스트 프레스', [25, 35], [15, 15], 2)
        ],
        72),
    new ExerciseGroup(
        3,
        '2022/02/18',
        [
          new DistanceTimeExercise('걷기', 2.6, 25),
          new TimeExercise('스트레칭', 13),
          new WeightExercise('체스트 프레스', [35, 35], [25, 15], 2)
        ],
        72)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f4f6),
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
                          index: exerciseGroupList[index].index,
                          date: exerciseGroupList[index].date,
                          exercises: exerciseGroupList[index].exercises,
                          time: exerciseGroupList[index].totalTime);
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
