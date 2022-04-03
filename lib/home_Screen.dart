// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_observer_pattern/logic/count_observable.dart';
import 'package:flutter_observer_pattern/logic/count_observer.dart';
import 'package:flutter_observer_pattern/logic/observer_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static late int count = 20;
  @override
  Widget build(BuildContext context) {
    print("the count :$count");
    return SafeArea(
      child: Scaffold(
        body: ObserverBuilder<CountObserver>(
          type: CountObserver(cobservable: CountObservable()),
          builder: (context, value) {
            return StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              int result = count + 1;
                              value.observable.setCount(count: result);
                              count = value.notify();
                              print(count);
                            });
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 25,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          count.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          width: 100,
                          height: 100,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Text(
                            "Product",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    ViewerWidget(name: "Viewer 1", count: count),
                    const SizedBox(height: 10),
                    ViewerWidget(name: "Viewer 2", count: count),
                    const SizedBox(height: 10),
                    ViewerWidget(name: "Viewer 3", count: count),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class ViewerWidget extends StatelessWidget {
  const ViewerWidget({
    Key? key,
    required this.name,
    required this.count,
  }) : super(key: key);

  final int count;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 100,
          height: 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            count.toString(),
            style: const TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
