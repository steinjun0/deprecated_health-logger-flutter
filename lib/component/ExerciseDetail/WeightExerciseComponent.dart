import 'package:flutter/material.dart';
import 'package:health_logger/class/Exercise.dart';

import '../../ExerciseDetailPage.dart';

class SetComponent extends StatelessWidget {
  final data;
  final index;
  var updateWeightData;
  var updateCountData;
  var weightAutoUnitTextField;
  var countAutoUnitTextField;

  SetComponent(
    this.data,
    this.index, {
    Key? key,
  }) : super(key: key) {
    updateWeightData = (text) {
      data['weight'] = num.parse(text);
    };

    updateCountData = (text) {
      data['count'] = num.parse(text);
    };
    weightAutoUnitTextField =
        AutoUnitTextField('무게(kg)', unit: 'kg', onChange: updateWeightData);
    countAutoUnitTextField =
        AutoUnitTextField('횟수', unit: '회', onChange: updateCountData);

    var weightTextController = weightAutoUnitTextField.controller;
    var countTextController = countAutoUnitTextField.controller;

    if (data['weight'].toString() == '0') {
      weightTextController.text = '';
    } else if (data['weight'] != '') {
      weightTextController.text = data['weight'].toString() + 'kg';
    }

    if (data['count'].toString() == '0') {
      countTextController.text = '';
    } else if (data['count'] != '') {
      countTextController.text = data['count'].toString() + '회';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Row(
        children: [
          SizedBox(
            width: 4,
          ),
          Text('${index + 1} set'),
          Expanded(
            child: FractionallySizedBox(
                widthFactor: 0.8, child: weightAutoUnitTextField),
          ),
          Expanded(
            child: FractionallySizedBox(
                widthFactor: 0.8, child: countAutoUnitTextField),
          ),
        ],
      ),
    );
  }
}

addInputComponents(
  List presentInputComponents,
) {
  presentInputComponents.add(
      SetComponent({'weight': 0, 'count': 0}, presentInputComponents.length));
}

class WeightExerciseComponent extends StatefulWidget {
  final WeightExercise distanceTimeExerciseObject;

  WeightExerciseComponent(this.distanceTimeExerciseObject, {Key? key})
      : super(key: key);

  @override
  State<WeightExerciseComponent> createState() =>
      _WeightExerciseComponentState();
}

class _WeightExerciseComponentState extends State<WeightExerciseComponent> {
  List weightTextControllers = [];
  List countTextControllers = [];

  List setData = [
    {'weight': 35, 'count': 15},
    {'weight': 25, 'count': 15},
  ];

  @override
  void dispose() {
    // 텍스트에디팅컨트롤러를 제거하고, 등록된 리스너도 제거된다.
    weightTextControllers.forEach((element) {
      element.dispose();
    });
    countTextControllers.forEach((element) {
      element.dispose();
    });
    super.dispose();
  }

  List inputComponents = [
    SetComponent({'weight': 0, 'count': 0}, 0)
  ];

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
                          widget.distanceTimeExerciseObject.name,
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
          ...inputComponents,
          // getInputComponents(
          //     setData, weightTextControllers, countTextControllers),
          TextButton(
              onPressed: () {
                setState(() {
                  addInputComponents(inputComponents);
                });
              },
              child: Text('세트 추가'))
        ],
      ),
    );
  }
}
