import 'package:e_ticket_app/core/app_utils/extension.dart';
import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SvgIconWidget extends StatelessWidget {
  const SvgIconWidget(
      {super.key,
      required this.svg,
      this.color,
      this.size,
      this.fit
      });
  final String svg;
  final Color? color;
  final double? size;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return 
  
     SizedBox.square(
      dimension: size,
      child: SvgPicture.asset(
        svg.svg(),
        fit: fit?? BoxFit.contain,
        color: color ??  AppColors.primary(context),
        width: size,
      ),
    );
  }
}

class SvgIconWithoutColorWidget extends StatelessWidget {
  const SvgIconWithoutColorWidget(
      {super.key,
      required this.svg,
       this.size
      });
  final String svg;
  final double? size ; 
 
  @override
  Widget build(BuildContext context) {
    return 
  
     SizedBox.square(
      dimension: size,
    
       child: SvgPicture.asset(
         svg.svg(),
         fit: BoxFit.contain,
         // color:color ??  AppColors.primary(context),
         width: size ,
       ),
     );
  }
}
