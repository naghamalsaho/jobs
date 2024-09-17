import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/company&seeker/home_widgets/icon_app_bar.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    super.key,
    required this.text,
    this.onPressedDrawer,
    required this.onPressedSearch,
  });
  final String text;
  final void Function()? onPressedDrawer;
  final void Function()? onPressedSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

        borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 Text(
                  "Jobs",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: AppColor.praimaryColor,
                    fontFamily: "Pacifico",
                  ),
                ),
                const Spacer(),
                IconHomeAppBar(
                  onPressedSearch: onPressedSearch,
                  icon: Icons.search,
                ),
                const SizedBox(width: 8),
                IconHomeAppBar(
                  onPressedSearch: onPressedDrawer,
                  icon: Icons.menu,
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8.0, left: 8.0),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w100,
                 color: AppColor.PraimaryColor(),
                  fontFamily: "Pacifico",
                  height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
