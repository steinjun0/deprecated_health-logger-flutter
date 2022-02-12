class ExerciseGroup {
  final int index;
  final String date;
  final List exercises;
  final int totalTime;

  ExerciseGroup(this.index, this.date, this.exercises, this.totalTime);
}

class ExerciseGroupDetail extends ExerciseGroup {
  ExerciseGroupDetail(
      int index, String date, List<Exercise> exercises, int totalTime)
      : super(index, date, exercises, totalTime);
}

class Exercise {
  final String name;

  Exercise(this.name);

  @override
  String toString() {
    return 'name: ${this.name}';
  }
}

class TimeExercise extends Exercise {
  final double time;

  TimeExercise(String name, this.time) : super(name);

  @override
  String toString() {
    return 'name: ${this.name}\ntime: ${time}';
  }
}

class DistanceTimeExercise extends Exercise {
  final double distance;
  final double time;

  DistanceTimeExercise(String name, this.distance, this.time) : super(name);

  @override
  String toString() {
    return 'name: ${this.name}\ndistance: ${distance}\ntime: ${time}';
  }
}

class WeightExercise extends Exercise {
  final List<double> weight;
  final List<int> count;
  final int set;

  WeightExercise(String name, this.weight, this.count, this.set) : super(name) {
    if (this.weight.length != this.set && this.count.length != this.set) {
      throw StateError;
    }
  }

  @override
  String toString() {
    return 'name: ${this.name}\nweight: ${weight.toString()}\ncount: ${count.toString()}\nset: $set';
  }
}
