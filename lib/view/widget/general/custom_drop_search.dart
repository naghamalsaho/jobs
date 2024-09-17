import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class CustomDropDownSearch extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final void Function(dynamic)? onChanged;
  final List<dynamic> items;
  final String? selectedItem;

  const CustomDropDownSearch({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    this.onChanged,
    required this.items,
    this.selectedItem,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: DropdownSearch(
        
          dropdownDecoratorProps: DropDownDecoratorProps(
            
            dropdownSearchDecoration: InputDecoration(
              
              labelText: label,
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.grey),
              //labelStyle: const TextStyle(color: AppColor.Grey()),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              prefixIcon: Icon(icon, color:AppColor.IconColor()),
              filled: true,
              fillColor:AppColor.Pink(),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none),
            ),
            baseStyle:  TextStyle(fontWeight: FontWeight.bold, color: AppColor.black),
          ),
          popupProps: PopupProps.menu(
            showSearchBox: true,
            // title: Text(selectedItem),
            // fit: FlexFit.tight,
            isFilterOnline: true,
            searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              prefixIcon: Icon(icon, color: Colors.deepPurple),
              filled: true,
              fillColor: Colors.deepPurple.shade50,
              hintText: hint,
            )),
            // searchDelay: Duration(seconds: 1)
            constraints: BoxConstraints.loose(const Size.fromHeight(400)),
          ),
          items: items,
          selectedItem: selectedItem,
          onChanged: onChanged),
    );
  }
}
