import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  getAllOppData() async {
    var response = await crud.getData(AppLink.allOpportunities);
    return response.fold((l) => l, (r) => r);
  }

  getAllPostsData() async {
    var response = await crud.getData(AppLink.viewPost);
    return response.fold((l) => l, (r) => r);
  }

  getNews() async {
    var response = await crud.getData(AppLink.getNews);
    return response.fold((l) => l, (r) => r);
  }

  Future<File> getFile(String url, String fileName) async {
    String pdfurl = '${AppLink.serverimage}/$url';
    final response = await http.get(Uri.parse(pdfurl));
        print("response");

    print(response);
    final dir = await getExternalStorageDirectory();
    final file = File('${dir!.path}/$fileName');
    await file.writeAsBytes(response.bodyBytes);
        print(file);

    return file;
  }
}
