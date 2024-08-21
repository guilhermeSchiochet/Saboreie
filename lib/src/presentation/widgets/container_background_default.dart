import 'package:flutter/material.dart';

class ContainerBackgroundDefault extends StatelessWidget {
  final Size? size;
  final Widget? child;

  const ContainerBackgroundDefault({super.key, this.child, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size?.height ?? 50,
      width: size?.width ?? 50,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(80, 117, 138, 0.1),
        borderRadius: BorderRadius.circular(100)
      ),
      child: child,
    );
  }
}