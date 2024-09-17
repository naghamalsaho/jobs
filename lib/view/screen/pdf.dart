

// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';

class UserInputPage extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Your Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Name'),
              onChanged: (value) => userController.name.value = value,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (value) => userController.email.value = value,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Generate PDF'),
              onPressed: () {
                userController.generateAndSavePdf();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class UserController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;

  Future<void> generateAndSavePdf() async {
    final pdf = pw.Document();

    const PdfColor baseColor = PdfColors.teal;
    const PdfColor accentColor = PdfColors.orange;
    final pw.Font titleFont = pw.Font.timesBold();
    final pw.Font contentFont = pw.Font.helvetica();
    List<String> language = ['aa', 'bb', 'cc', 'dd'];
    List<String> skills = ['aa', 'bb', 'cc', 'dd'];
    List<String> certificates = <String>['aa', 'bb', 'cc', 'dd'];
    List<String> projects = <String>['aa', 'bb', 'cc', 'dd'];
    List<String> experiences = <String>['aa', 'bb', 'cc', 'dd'];
    List<String> contacts = <String>['aa', 'bb', 'cc', 'dd'];
    List<String> profile = <String>['aa', 'bb', 'cc', 'dd'];
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.zero,
        build: (pw.Context context) {
          return pw.Row(
            children: [
              pw.Expanded(
                flex: 2,
                child: pw.Container(
                  color: baseColor,
                  child: pw.Column(
                    children: [
                      pw.Container(
                        decoration: pw.BoxDecoration(
                          color: PdfColors.white,
                          borderRadius: pw.BorderRadius.circular(25),
                        ),
                        height: 100,
                        width: 100,
                      ),
                      pw.SizedBox(height: 30),
                      pw.Text("User Name",
                          textScaleFactor: 2,
                          style: pw.TextStyle(
                              font: titleFont, color: PdfColors.white)),
                      pw.Text("Job Title",
                          textScaleFactor: 1.5,
                          style: pw.TextStyle(
                              font: contentFont, color: PdfColors.white)),
                      pw.SizedBox(height: 30),
                      pw.Divider(height: 10),
                      SectionTitle(
                          'Contact',
                          titleFont,
                          accentColor,
                          pw.ListView(children: [
                            for (int i = 0; i < skills.length; i++)
                              
                                pw.Text(  skills[i]),
                              
                          ])),
                      SectionTitle(
                          'Education', titleFont, accentColor, pw.SizedBox()),
                      SectionTitle(
                          'Languages', titleFont, accentColor, pw.SizedBox()),
                    ],
                  ),
                ),
              ),
              pw.Expanded(
                flex: 3,
                child: pw.Container(
                  color: PdfColors.amber50,
                  child: pw.Column(
                    children: [
                      pw.SizedBox(
                        height: 4,
                      ),
                      SectionTitle(
                          'Experience', titleFont, accentColor, pw.SizedBox()),
                      SectionTitle(
                          'Skills', titleFont, accentColor, pw.SizedBox()),
                      SectionTitle(
                          'Expertise', titleFont, accentColor, pw.SizedBox()),
                      pw.SizedBox(height: 20),

                      //  SectionTitle("yyyy", pw.Text("kkkkk")),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );

    final directory =
        await getExternalStorageDirectory().whenComplete(() => print('LLLL'));

    String documentPath = directory!.path;
    String filePath = "$documentPath/user_information.pdf";
    File file = File(filePath);
    await file.writeAsBytes(await pdf.save()).whenComplete(() =>
        Get.defaultDialog(title: "Yes", middleText: "Cv created ", actions: [
          MaterialButton(
            onPressed: () {
              OpenFile.open(filePath);
            },
            child: const Text("Open"),
          )
        ]));
  }

  pw.Widget SectionTitle(
      String title, pw.Font font, PdfColor color, pw.Widget child) {
    return pw.Expanded(
      child: pw.Column(
        children: [
          pw.Padding(
            padding: const pw.EdgeInsets.only(right: 90, top: 20),
            child: pw.Text(title,
                style: pw.TextStyle(
                    font: font,
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                    color: color)),
          ),
          pw.SizedBox(height: 4),
          pw.Divider(
            indent: 30,
            height: 10,
          ),
          child,
        ],
      ),
    );
  }
}
