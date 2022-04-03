import 'package:flutter_observer_pattern/logic/Icount_observer.dart';

class CountObservable {
  final List<IcountObserver> _observers = [];
  late int _count;
  void setCount({required int count}) {
    _count = count;
    print("set count method : $count");
    notifyObserver();
  }

  int getCount() => _count;

  void attach({required IcountObserver observer}) {
    _observers.add(observer);
  }

  notifyObserver() {
    for (IcountObserver observer in _observers) {
      observer.update();
    }
  }
}
