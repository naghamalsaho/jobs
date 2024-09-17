import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/color.dart';

class CustomDropDownButton extends StatelessWidget {
  final String label;
  final String hint;

  final List<String> items;
  final String? selectedItem;
  final IconData icon;
  final void Function(String?)? onChanged;
  List<DropdownMenuItem<String>>? items2;
  CustomDropDownButton(
      {super.key,
      required this.label,
      required this.items,
      this.selectedItem,
      required this.icon,
      required this.onChanged,
      required this.hint,
      this.items2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          //  hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          prefixIcon: Icon(icon, color: AppColor.IconColor()),
          filled: true,
          fillColor: AppColor.Pink(),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            dropdownColor: AppColor.Backgroundcolor(),
            value: selectedItem,
            hint: Text(hint),
            isExpanded: true,
            items: items.map((value) {
              return DropdownMenuItem<String>(
                
                value: value,
                child: Text(
                  value.toString().replaceAll('_', ' ').capitalizeFirst!,
                  style: TextStyle(
                      color: AppColor.TextColor(), fontFamily: "Gafata", fontWeight: FontWeight.w600),
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
