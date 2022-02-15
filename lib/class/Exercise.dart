import '../utils.dart' as Utils;

class ExerciseGroup {
  final int index;
  final String date;
  final List<Exercise> exercises;
  final int totalTime;

  ExerciseGroup(this.index, this.date, this.exercises, this.totalTime);
}

class ExerciseGroupDetail extends ExerciseGroup {
  ExerciseGroupDetail(
      int index, String date, List<Exercise> exercises, int totalTime)
      : super(index, date, exercises, totalTime);
}

abstract class Exercise {
  final String name;

  Exercise(this.name);

  @override
  String toString() {
    return 'name: ${this.name}';
  }

  String getResultSummary();
}

class TimeExercise extends Exercise {
  final double time;

  TimeExercise(String name, this.time) : super(name);

  @override
  String toString() {
    return 'name: ${this.name}\ntime: ${time}';
  }

  @override
  String getResultSummary() {
    return '${Utils.getNumberRemovedZeroTrailing(this.time)}분';
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

  @override
  String getResultSummary() {
    return '${Utils.getNumberRemovedZeroTrailing(this.distance)}km / ${Utils.getNumberRemovedZeroTrailing(this.time)}분';
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

  getAverage(List list) {
    double avg = 0;
    list.forEach((element) {
      avg += element;
    });
    avg /= list.length;
    return avg;
  }

  getAverageWeight() {
    return Utils.getNumberRemovedZeroTrailing(getAverage(this.weight));
  }

  getAverageCount() {
    return Utils.getNumberRemovedZeroTrailing(getAverage(this.count));
  }

  @override
  String getResultSummary() {
    return '${getAverageWeight()}km / ${getAverageCount()}회';
  }
}
