// ignore: file_names
import 'package:flutter_observer_pattern/logic/count_observable.dart';

abstract class IcountObserver {
  late CountObservable observable;
  void update();
}
