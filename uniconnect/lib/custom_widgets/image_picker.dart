import 'package:image_picker/image_picker.dart';

selectPickImage(ImageSource imageSource) async{
  final ImagePicker image = ImagePicker();
  XFile? file = await image.pickImage(source: imageSource);
  if(file != null){
    return await file.readAsBytes();
  }
  print('foto çekerken bi hata oluştu');
}