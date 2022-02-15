import 'package:flutter/material.dart';
import 'package:health_logger/class/Exercise.dart';

import '../../ExerciseDetailPage.dart';

getInputComponents(List data, weightTextControllers, countTextControllers) {
  List result = [];

  int index = 1;
  data.forEach((element) {
    var weightTextController = TextEditingController();
    var countTextController = TextEditingController();
    weightTextControllers.add(weightTextController);
    countTextControllers.add(countTextController);

    if (element['weight'] != '') {
      weightTextController.text = element['weight'].toString() + 'kg';
    }

    result.add(Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Row(
        children: [
          SizedBox(
            width: 4,
          ),
          Text('$index set'),
          Expanded(
            child: FractionallySizedBox(
                widthFactor: 0.8,
                child: AutoUnitTextField(weightTextController, '무게(kg)',
                    unit: 'kg')),
          ),
          Expanded(
            child: FractionallySizedBox(
                widthFactor: 0.8,
                child: AutoUnitTextField(countTextController, '횟수', unit: '회')),
          ),
        ],
      ),
    ));
    index++;
  });
  return result;
}

class WeightExerciseComponent extends StatelessWidget {
  final WeightExercise distanceTimeExerciseObject;

  WeightExerciseComponent(this.distanceTimeExerciseObject, {Key? key})
      : super(key: key);

  List weightTextControllers = [];
  List countTextControllers = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                color: Colors.red,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Container(
                    child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          distanceTimeExerciseObject.name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '웨이트',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w200,
                              color: Color(0xff6D757F)),
                        ),
                        // Text('30kCal',
                        //     style: TextStyle(
                        //         fontSize: 12,
                        //         fontWeight: FontWeight.w200,
                        //         color: Color(0xff6D757F))),
                      ],
                    ),
                  ],
                )),
              ),
            ],
          ),
          SizedBox(height: 12),
          ...getInputComponents([
            {'weight': 35, 'count': 15},
            {'weight': 25, 'count': 15},
          ], weightTextControllers, countTextControllers)
        ],
      ),
    );
  }
}
