import 'package:e_ticket_app/modules/sales%20items/presentation/items/add%20edit%20items/widget/box_select_color_widget.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/items/add%20edit%20items/widget/box_select_shape_widget.dart';
import 'package:flutter/material.dart';

class BoxSelectColorAndShapeWidget extends StatelessWidget {
  const BoxSelectColorAndShapeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
                      children: [
                        BoxSelectColorWidget(),
                        SizedBox(
                          height: 15.0,
                        ),
                        BoxSelectShapeWidget(),
                      ],
                    );
  }
}