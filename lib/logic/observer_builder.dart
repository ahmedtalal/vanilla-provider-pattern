import 'package:flutter/material.dart';

class ObserverBuilder<T> extends SingleChildStatelessWidget {
  final T type;
  const ObserverBuilder({
    Key? key,
    required this.type,
    required this.builder,
  }) : super(key: key, type: type);
  final Widget Function(
    BuildContext context,
    T value,
  ) builder;

  @override
  Widget buildWithChild(BuildContext context, value) {
    return builder(context, value);
  }
}

abstract class SingleChildStatelessWidget<T> extends StatelessWidget {
  final T _child;

  const SingleChildStatelessWidget({Key? key, required T type})
      : _child = type,
        super(key: key);

  Widget buildWithChild(BuildContext context, T value);
  @override
  Widget build(BuildContext context) => buildWithChild(context, _child);
}
