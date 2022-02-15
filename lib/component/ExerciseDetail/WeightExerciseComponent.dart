import 'package:flutter/material.dart';

getAutoUnitTextField(TextEditingController controller, String hintText,
    {String unit = ''}) {
  FocusNode _focus = FocusNode();
  _focus.addListener(() {
    if (_focus.hasFocus) {
      if (controller.text.length != 0) {
        controller.text =
            controller.text.substring(0, controller.text.length - unit.length);
        debugPrint(controller.text);
      }
    } else {
      if (controller.text.length != 0) {
        controller.text += unit;
        debugPrint(controller.text);
      }
    }
  });
  return TextField(
    focusNode: _focus,
    controller: controller,
    decoration: InputDecoration(
      // contentPadding: EdgeInsets.all(0),
      isDense: true,
      border: UnderlineInputBorder(),
      hintText: hintText,
    ),
  );
}

getInputComponents(List data) {
  List result = [];
  List weightTextControllers = [];
  int index = 1;
  data.forEach((element) {
    var weightTextController = TextEditingController();
    weightTextControllers.add(weightTextController);
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
                child: getAutoUnitTextField(weightTextController, '무게(kg)',
                    unit: 'kg')),
          ),
          Expanded(
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: TextField(
                decoration: InputDecoration(
                  // contentPadding: EdgeInsets.all(0),
                  isDense: true,
                  border: UnderlineInputBorder(),
                  hintText: '횟수',
                ),
              ),
            ),
          ),
        ],
      ),
    ));
    index++;
  });
  return result;
}

WeightExerciseComponent(distanceTimeExerciseObject) {
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
          {'weight': 25, 'count': 15}
        ])
      ],
    ),
  );
}
