import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/bindings/initialbindinds.dart';
import 'package:jobs/core/localization/changelocal.dart';
import 'package:jobs/core/localization/translation.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
     // useInheritedMediaQuery: true,
      translations: MyTranslation(),
      title: 'Flutter Demo',
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      theme: controller.apptheme ,
   //  home:NewsViewk(),
    initialRoute: '/splash',
      initialBinding: InitialBindings(),
     getPages: routes,
    );
  }
}
