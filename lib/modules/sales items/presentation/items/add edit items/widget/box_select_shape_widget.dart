import 'package:e_ticket_app/core/app_utils/extension.dart';
import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/service/item_shape_service.dart';
import 'package:e_ticket_app/shared/widgets/svgIcon.dart';
import 'package:flutter/material.dart';

class BoxSelectShapeWidget extends StatefulWidget {
  const BoxSelectShapeWidget({super.key});

  @override
  State<BoxSelectShapeWidget> createState() => _BoxSelectShapeWidgetState();
}

class _BoxSelectShapeWidgetState extends State<BoxSelectShapeWidget> {
  List<bool> shapeSelectList = List.filled(4, false);
  @override
  initState() {
    super.initState();
    shapeSelectList[0] = true;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, crossAxisSpacing: 15.0, mainAxisSpacing: 15.0),
      itemBuilder: (context, index) {
        return InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            setState(() {
              shapeSelectList = List.filled(4, false);
              shapeSelectList[index] = true;
            });
          },
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Visibility(
                visible: Theme.of(context).brightness == Brightness.dark,
                replacement: SvgIconWithoutColorWidget(
                  svg: ItemShapeService.shapesList[index],
                ),
                child: Image.asset(ItemShapeService.shapesList[index].jpg()),
              ),
              Visibility(
                  visible: shapeSelectList[index],
                  child: Icon(
                    Icons.check,
                    color: AppColors.normalTextGrey(context),
                    size: 30.0,
                  ))
            ],
          ),
        );
      },
    );
  }
}
