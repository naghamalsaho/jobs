import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';
import 'package:path_provider/path_provider.dart';

class FileData {
 late Crud crud;
  FileData(this.crud);

    deleteImage(int idPost,int idimg) async {
    var response = await crud.deleteData("${AppLink.deleteImage}/$idPost/$idimg");
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }
  
    deleteFile(int idPost,int idfile) async {
    var response = await crud.deleteData("${AppLink.deleteFile}/$idPost/$idfile");
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }

  //  Future<File> getFile(String url, String fileName) async {
  //   String pdfurl = '${AppLink.serverimage}/$url';
  //   final response = await http.get(Uri.parse(pdfurl));
  //   final dir = await getExternalStorageDirectory();
  //   final file = File('${dir!.path}/$fileName');
  //   await file.writeAsBytes(response.bodyBytes);
  //   return file;
  // }
     downloadImage(String url, String fileName) async {
       final response = await http.get(Uri.parse("${AppLink.serverimage}/${url}"));
       if (response.statusCode == 200) {
         final bytes = response.bodyBytes;
         final tempDir = await getExternalStorageDirectory();
         final file = File('${tempDir!.path}/$fileName');
         await file.writeAsBytes(bytes);
         return file;
       } else {
         throw Exception('Failed to download image');
       }
     }
     
}
