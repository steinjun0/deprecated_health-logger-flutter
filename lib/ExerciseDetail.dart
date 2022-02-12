import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExerciseDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NextPage'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text('Get.back()'),
            ),
          ],
        ),
      ),
    );
  }
}
