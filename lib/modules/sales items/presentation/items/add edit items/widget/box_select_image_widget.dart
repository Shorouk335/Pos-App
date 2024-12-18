import 'dart:io';
import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/service/imageService/imageService.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BoxSelectImageWidget extends StatefulWidget {
  const BoxSelectImageWidget({super.key});

  @override
  State<BoxSelectImageWidget> createState() => _BoxSelectImageWidgetState();
}

class _BoxSelectImageWidgetState extends State<BoxSelectImageWidget> {
  File? imageSelected  ; 
  
  setImage (File  img){
    setState(() {
    imageSelected = img ;  
      
    });
  }
  deleteImage (){
    setState(() {
    imageSelected = null ;  
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [ 

          Visibility(
            visible: imageSelected == null,
        
        replacement: Stack( 
          alignment: AlignmentDirectional.topStart,
          children: [ 
            SizedBox(
              width: 150,
              height: 150,
              child: Image.file(imageSelected ?? File("") , fit: BoxFit.cover,)) , 
            InkWell(
              onTap: (){
                deleteImage();
              },
              child:  CircleAvatar(
                backgroundColor: AppColors.backgroundColorMode(context) , 
                radius: 15.0,
                child: Icon(Icons.close , color: AppColors.normalTextGrey(context),),
              ),
            )

          ],
        ) ,
            child: Container(
              height: 150,
              width: 150,
              color: AppColors.buttonBackGroundLight(context),
              child:  Icon(
                Icons.photo,
                color: AppColors.normalTextGrey(context),
                size: 80.0,
              ),
            ),
             ),
          const SizedBox(
            width: 15.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () { 
                  ImageService.pickImageFromGallery().then((value){
                    if(value != null) {
                      setImage(value);
                    }

                  }); 
                },
                child: Row(
                  children: [
                     Icon(
                      Icons.folder,
                      color: AppColors.normalTextGrey(context),
                      size: 30.0,
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    CustomText(context: context,
                      text: "choose_photo".tr(),
                    ),
                  ],
                ),
              ) , 
              const SizedBox(height: 15.0,) , 
              InkWell(
                onTap: () {
                   ImageService.pickImageFromCamera().then((value){
                    if(value != null) {
                      setImage(value);
                    }

                  }); 
              
                },
                child: Row(
                  children: [
                     Icon(
                      Icons.camera_alt,
                      color: AppColors.normalTextGrey(context),
                      size: 30.0,
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    CustomText(context: context,
                      text: "take_photo".tr(),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
