import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './class/Exercise.dart';
import './component/ExerciseDetail/DistanceTimeExerciseComponent.dart';
import './component/ExerciseDetail/WeightExerciseComponent.dart';

class AutoUnitTextField extends StatefulWidget {
  final String hintText;
  String unit = '';
  final onChange;
  final controller = TextEditingController();
  final FocusNode focus = FocusNode();

  AutoUnitTextField(this.hintText, {Key? key, this.unit = '', this.onChange})
      : super(key: key) {}

  @override
  State<AutoUnitTextField> createState() => _AutoUnitTextFieldState(focus);
}

class _AutoUnitTextFieldState extends State<AutoUnitTextField> {
  _AutoUnitTextFieldState(focus) {
    focus.addListener(() {
      debugPrint('get in focus listener');
      if (focus.hasFocus) {
        if (widget.controller.text.length != 0) {
          widget.controller.text = widget.controller.text
              .substring(0, widget.controller.text.length - widget.unit.length);
        }
      } else {
        if (widget.controller.text.length != 0) {
          widget.controller.text += widget.unit;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: widget.focus,
      controller: widget.controller,
      decoration: InputDecoration(
        // contentPadding: EdgeInsets.all(0),
        isDense: true,
        border: UnderlineInputBorder(),
        hintText: widget.hintText,
      ),
      onChanged: widget.onChange,
    );
  }
}

class ExerciseController extends GetxController {
  ExerciseGroupDetail? exerciseDetail;

  ExerciseController() {
    if (Get.parameters['param'] == 'new') {
      exerciseDetail = ExerciseGroupDetail(
          -1,
          DateTime.now().toString(),
          [
            DistanceTimeExercise('걷기', 1.6, 10),
            TimeExercise('스트레칭', 10),
            WeightExercise('체스트 프레스', [35, 35, 35], [15, 15, 12], 3),
          ],
          0);
    } else {
      exerciseDetail = ExerciseGroupDetail(
          1,
          '2022/02/17',
          [
            DistanceTimeExercise('걷기', 1.6, 10),
            TimeExercise('스트레칭', 10),
            WeightExercise('체스트 프레스', [35, 35, 35], [15, 15, 12], 3),
          ],
          64);
    }
  }
}

class ExerciseDetailPage extends StatelessWidget {
  final exerciseController = Get.put(ExerciseController());

  // utils
  getStringOfExercises(List exercises) {
    List<Widget> stringExercieses = [];
    for (Object exercise in exercises) {
      stringExercieses.add(Text(exercise.toString()));
      stringExercieses.add(const SizedBox(
        height: 12,
      ));
    }
    return stringExercieses;
  }

  isNewDetailPage() {
    return Get.parameters['param'] == 'new';
  }

  // components
  getHeaderOfDetailPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          exerciseController.exerciseDetail!.date,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              isNewDetailPage()
                  ? '새 운동을 시작해볼까요?'
                  : '운동 ${Get.parameters['param']}일 째 \u{1F525}',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
              decoration: BoxDecoration(
                color: Color(0xffF18B2C),
                borderRadius: const BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
              child: Text(
                '진행중',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
          ],
        ),
      ],
    );
  }

  getDetailExerciseCard(exerciseObject) {
    // print(exerciseObject);
    if (exerciseObject is TimeExercise) {
    } else if (exerciseObject is DistanceTimeExercise) {
      return DistanceTimeExerciseComponent(exerciseObject);
    } else if (exerciseObject is WeightExercise) {
      return WeightExerciseComponent(exerciseObject);
    }
  }

  var exerciseList = [
    new DistanceTimeExercise('걷기', 1, 10),
    new WeightExercise('체스트 프레스', [25, 30], [15, 13], 2),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExerciseController>(
        init: ExerciseController(),
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              title: Text(isNewDetailPage() ? '운동 추가하기' : '운동 기록'),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(12, 60, 12, 40),
                  child: getHeaderOfDetailPage(),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              width: 200,
                              child:
                                  getDetailExerciseCard(exerciseList[index]));
                        })),
                // FractionallySizedBox(
                //   widthFactor: 0.8,
                //   child: TextField(
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(),
                //       labelText: 'hi',
                //     ),
                //   ),
                // ),
                // TextButton(
                //   onPressed: () => Get.back(),
                //   child: Text('${Get.parameters['param']}'),
                // ),
                // Text('index: ${exerciseController.exerciseDetail!.index}'),
                // Text(exerciseController.exerciseDetail!.date),
                // Text(
                //     'totalTime: ${exerciseController.exerciseDetail!.totalTime}'),
                // const SizedBox(
                //   height: 12,
                // ),
                // Column(
                //   children: getStringOfExercises(
                //       exerciseController.exerciseDetail!.exercises),
                // )
              ],
            ),
          );
        });
  }
}
