import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/others_profile/custom_info.dart';

class buildInfoSection2 extends StatelessWidget {
  final String title;
  final List infoList;
  final IconData icon;
  const buildInfoSection2(
      {super.key,
      required this.title,
      required this.infoList,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: ExpansionTile(
     
        title: ListTile(
          leading: Icon(icon),
          title: Text(title),
          titleTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        children: infoList
            .map<Widget>(
              (info) => Text(
                info.toString(),
                style: TextStyle(fontSize: 16),
              ),
            )
            .toList(),
      ),
    );
  }
}

class buildInfoSection extends StatelessWidget {
  final String title;
  final List infoList;
  final IconData icon;
  const buildInfoSection(
      {super.key,
      required this.title,
      required this.infoList,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      buildInfo(
       
        info: title,
        icon: icon,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Wrap(
          spacing: 1.0,
          alignment: WrapAlignment.start ,
          runAlignment: WrapAlignment.start,
          children: List.generate(

            infoList.length,
            (index) {
              final l = infoList[index];
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey, width: 1.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 3.0, horizontal: 14),
                    child: Text(
                      l,
                      style: TextStyle(color: AppColor.black, fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      )
    ]);
  }
}
