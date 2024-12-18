import 'package:e_ticket_app/core/service/item_shape_service.dart';
import 'package:flutter/material.dart';

class BoxSelectColorWidget extends StatefulWidget {
  const BoxSelectColorWidget({super.key});

  @override
  State<BoxSelectColorWidget> createState() => _BoxSelectColorWidgetState();
}

class _BoxSelectColorWidgetState extends State<BoxSelectColorWidget> {
  List<bool> colorSelectList = List.filled(8, false);
     @override
     initState(){
    super.initState();
    colorSelectList[0] = true ; 
   }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 8,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, crossAxisSpacing: 15.0, mainAxisSpacing: 15.0),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              colorSelectList = List.filled(8, false);
              colorSelectList[index] = true;
            });
          },
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                color: ItemShapeService.colorsMap[index],
              ),
              Visibility(
                  visible: colorSelectList[index],
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 30.0,
                  ))
            ],
          ),
        );
      },
    );
  }
}
