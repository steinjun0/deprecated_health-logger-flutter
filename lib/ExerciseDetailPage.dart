import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './class/Exercise.dart';

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

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExerciseController>(
        init: ExerciseController(),
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('NextPage'),
            ),
            body: Center(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () => Get.back(),
                    child: Text('${Get.parameters['param']}'),
                  ),
                  Text('index: ${exerciseController.exerciseDetail!.index}'),
                  Text(exerciseController.exerciseDetail!.date),
                  Text(
                      'totalTime: ${exerciseController.exerciseDetail!.totalTime}'),
                  const SizedBox(
                    height: 12,
                  ),
                  Column(
                    children: getStringOfExercises(
                        exerciseController.exerciseDetail!.exercises),
                  )
                ],
              ),
            ),
          );
        });
  }
}
