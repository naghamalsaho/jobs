import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/image_assest.dart';

class UserChat extends StatelessWidget {
  const UserChat({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text("aaaaaaaaa"),
        ),
        body: Container(
          width: width,
          height: double.infinity,
          child: ListView(
            primary: false,
            children: const [
              ChatContact(),
            ],
          ),
        ));
  }
}

class ChatContact extends StatelessWidget {
  const ChatContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        width: width,
        height: 75,
        child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        AppImageAsset.logo,
                        width: 58,
                        height: 58,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 40),
                    child: Row(
                      children: [

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Padding(padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "user name",
                                style: TextStyle(
                                  
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,

                                ),
                              ),
                              ),

                              Text("")

                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
