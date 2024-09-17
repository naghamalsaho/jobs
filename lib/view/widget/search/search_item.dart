import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/api_link.dart';
import 'package:jobs/core/constants/color.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key,
    required this.user,
    this.onTap,
    required this.email,
    required this.type,
    required this.image,
  });
  final String user;
  final String email;
  final Function()? onTap;
  final String type;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.White(),
      margin: EdgeInsets.all(1),
      child: ListTile(
        trailing: Icon(
          type == 'company' ? Icons.business : Icons.person,
          color: AppColor.Grey(),
        ),
        leading: CircleAvatar(
          backgroundImage: image != null
              ? NetworkImage("${AppLink.serverimage}/${image}")
              : null,
          radius: 28,
          backgroundColor: AppColor.PraimaryColor(),
          child: image == null
              ? Icon(
                  type == 'company' ? Icons.business : Icons.person,
                  color: AppColor.White(),
                )
              : null,
        ),
        title: Text(user,
            style: TextStyle(
                color: AppColor.TextColor(), fontWeight: FontWeight.bold)),
        subtitle: Text(email, style: TextStyle(color: AppColor.Grey())),
        onTap: onTap,
      ),
    );
  }
}
