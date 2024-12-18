import 'package:flutter/material.dart';

class BoxBreakWidget extends StatelessWidget {
  const BoxBreakWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return    Container(
               height: 25.0,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.05),
                  boxShadow: [
                    BoxShadow(
                      blurStyle: BlurStyle.solid,
                      color: Colors.grey.withOpacity(0.05),
                      // spreadRadius: 2.5,
                      blurRadius: 2.5,
                      offset: const Offset(1, 1),
                    ),
                  ]),
            );
  }
}