import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class ShowSmartDialog { 
  
  static bool isShow = false;

  static show() {
    if (isShow == false) {
      SmartDialog.show(
          clickMaskDismiss: false,
          animationType: SmartAnimationType.scale,
          animationTime: const Duration(milliseconds: 100),
          keepSingle: true,
          builder: (context)=>  Dialog(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: SizedBox(height: 150,width: 150, child: loadingWidget()),
      ),);

      isShow = true;
    }
  }

  static Center loadingWidget() =>  Center(
        child: CircularProgressIndicator(
          color: Color(0xff0A3B74),
        ),
      );

  static dismes() {
    if (isShow) {
      SmartDialog.dismiss();
      isShow = false;
    } else {}
  }

   static failure(String message) {    
    SmartDialog.showToast(
      message,
      builder: (context) {
        return SafeArea(
          child: Card(
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                        child: CustomText(context: context,text: message, color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

   static warning(String message) {    
    SmartDialog.showToast(
      message,
      builder: (context) {
        return SafeArea(
          child: Card(
            color:Colors.yellow.shade900.withOpacity(0.8),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.warning,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                        child: CustomText(context: context,text: message, color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
  
   static done (String message) {    
    SmartDialog.showToast(
      message,
      builder: (context) {
        return SafeArea(
          child: Card(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.done_all,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                        child: CustomText(context: context,text: message, color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
