import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageService {

  static final ImagePicker picker = ImagePicker();

  static Future<File?> pickImageFromGallery() async {
    final image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 30);

    return File(image!.path);
  }
  static Future<File?> pickImageFromCamera() async {
    final image =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 30);

    return File(image!.path);
  }


}
