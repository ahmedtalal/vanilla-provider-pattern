import 'package:flutter_observer_pattern/logic/Icount_observer.dart';
import 'package:flutter_observer_pattern/logic/count_observable.dart';

class CountObserver extends IcountObserver {
  CountObserver({required CountObservable cobservable}) {
    observable = cobservable;
    observable.attach(observer: this);
  }
  @override
  void update() {
    notify();
    print("update count : ${notify()}");
  }

  int notify() => observable.getCount();
}
