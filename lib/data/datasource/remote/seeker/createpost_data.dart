import 'dart:io';
import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';

class PostData {
  Crud crud;
  PostData(this.crud);
  createPostdata(String body, List<File?>? images,List< File?>? files) async {
    var response = await crud.postMutipleImagesAndData(
        AppLink.createPost,
        {"body": body, "images": images, "files": files},
        'images',
        images,
        'files',
        files);
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }

  deletePost(int id) async {
    var response = await crud.deleteData("${AppLink.deletePost}/$id");
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }

  editPostdata(int id, String? body, List<File>? images, List< File?>? files) async {
   
    var response = await crud.postMutipleImagesAndData(
       "${AppLink.editPost}/$id",
        {"_method": 'PUT', "body": body,  "images": images, "files": files},
        'images',
        images,
        'files',
        files);
    
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }

 
}
