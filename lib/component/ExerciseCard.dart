import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_logger/class/Exercise.dart';

class ExerciseCard extends StatelessWidget {
  final int index;
  final String date;
  final List<Exercise> exercises;

  final int time;

  // DateSummary({Key? key}, this.date, this.exercises, this.time) super(key: key);
  const ExerciseCard(
      {Key? key,
      required this.index,
      required this.date,
      required this.exercises,
      required this.time})
      : super(key: key);

  List<Widget> getExercisesTextList() {
    List<Exercise> exercises = this.exercises;
    List<Widget> exercisesTextList = [];

    for (var exercise in exercises) {
      exercisesTextList.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${exercise.name}"),
            Text("${exercise.getResultSummary()}"),
          ],
        ),
      ));
    }

    return exercisesTextList;
  }

  @override
  Widget build(BuildContext context) {
    int index = this.index;
    String date = this.date;
    int time = this.time;

    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(width: 1, color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      child: InkWell(
        onTap: () {
          Get.toNamed('/detail/$index');
        },
        child: Container(
          margin: EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(date), Text("$time")]),
              const SizedBox(
                height: 16,
              ),
              ...getExercisesTextList(),
            ],
          ),
        ),
      ),
    );
  }
}
