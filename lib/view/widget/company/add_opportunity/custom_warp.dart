import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class CustomWarp extends StatelessWidget {
  const CustomWarp({
    super.key,
    required this.list,
    required this.selectedIndex,
    required this.onSelected,
    required this.onDelete,
  });
  final List list;
  final int selectedIndex;
  final Function(int) onSelected;
  final Function(int) onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Wrap(
        spacing: 8.0,

        children: List<Widget>.generate(
          list.length,
          (index) {
            final l = list[index];
            return InputChip(
              color: MaterialStateProperty.resolveWith<Color>((states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey; // لون الحالة disabled
                }
                return AppColor.White(); // لون افتراضي
              }),
              label: Text(
                l,
                style: TextStyle(color: AppColor.TextColor()),
              ),
              onSelected: (_) => onSelected(index),
              onDeleted: () => onDelete(index),
              deleteIcon: Icon(
                Icons.cancel,
                size: 18,
                color: AppColor.Grey(),
              ),
              selected: selectedIndex == index,
              selectedColor: Colors.pink.shade100,
              showCheckmark: false,
              avatarBorder: Border.all(
                color: Colors.pink,
              ),
            );
          },
        ),
      ),
    );
  }
}
