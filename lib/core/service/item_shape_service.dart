import 'package:e_ticket_app/shared/widgets/svgIcon.dart';
import 'package:flutter/material.dart';

class ItemShapeService {
//#########COLORS############
  static Map<int, Color> colorsMap = {
    0: Colors.grey,
    1: Colors.red,
    2: Colors.pink,
    3: Colors.orange,
    4: Colors.lightGreen,
    5: Colors.green,
    6: Colors.blue,
    7: Colors.purple,
  };
  //#########SHAPES############

  static List<String> shapesList = ["square", "circle", "sun", "octagon"];

  static getCurrentItemShape(int color, String shape, bool isHome) {
    switch (shape) {
      case "square":
        return SvgIconWidget(
          svg: "square_fill",
          size: isHome ? null : 40,
          color: colorsMap[color],
        );
      case "circle":
        return SvgIconWidget(
          svg: "circle_fill",
          size: isHome ? null : 40,
          color: colorsMap[color],
        );
      case "sun":
        return SvgIconWidget(
          svg: "new_sun_fill",
          size: isHome ? null : 48,
          color: colorsMap[color],
          fit: BoxFit.cover,
      
         
        );

      case "octagon":
        return SvgIconWidget(
          svg: "octagon_fill",
          size: isHome ? null : 45,
          color: colorsMap[color],
        );

      default:
        return SvgIconWidget(
          svg: "circle_fill",
          size: isHome ? null : 40,
          color: colorsMap[1],
        );
    }
  }
}
