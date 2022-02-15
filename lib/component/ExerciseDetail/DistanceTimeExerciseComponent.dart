import 'package:flutter/material.dart';

import '../../ExerciseDetailPage.dart';

getInputComponents(distanceTextController, timeTextController) {
  return Row(
    children: [
      SizedBox(
        width: 32,
      ),
      Expanded(
        child: FractionallySizedBox(
            widthFactor: 0.8,
            child: AutoUnitTextField(distanceTextController, '거리(km)',
                unit: 'km')),
      ),
      Expanded(
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: AutoUnitTextField(timeTextController, '시간(분)', unit: '분'),
        ),
      ),
    ],
  );
}

DistanceTimeExerciseComponent(distanceTimeExerciseObject) {
  TextEditingController distanceTextController = TextEditingController();
  TextEditingController timeTextController = TextEditingController();
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
                      // Text(
                      //   '${getNumberRemovedZeroTrailing(exerciseObject.distance)}Km/'
                      //   '${getNumberRemovedZeroTrailing(exerciseObject.time)}분',
                      //   style: TextStyle(
                      //       fontSize: 18, fontWeight: FontWeight.w600),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '유산소',
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
        getInputComponents(distanceTextController, timeTextController)
      ],
    ),
  );
}
