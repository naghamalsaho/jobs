import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:jobs/controller/seeker/profile/create_profile_controller.dart';


class CountryController extends GetxController {
  var countries = [
    'Algeria',
    'Argentina',
    'Australia',
    'Belgium',
    'Brazil',
    'Canada',
    'China',
    'Denmark',
    'Egypt',
    'France',
    'Germany',
    'India',
    'Italy',
    'Japan',
    'Mexico',
    'Morocco',
    'Nigeria',
    'Russia',
    'Saudi Arabia',
    'South Africa',
    'Spain',
    'United Kingdom',
    'United States'
  ].obs;

  var selectedCountry = ''.obs;
}

class CountryDropdown extends StatelessWidget {
  final CountryController controller = Get.put(CountryController());

  @override
  Widget build(BuildContext context) {
    Get.put(CreateProfileControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Country Dropdown'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
      

              ListView(
            children: [
              DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                  disabledItemFn: (String s) => s.startsWith('I'),
                ),
                items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "Menu mode",
                    hintText: "country in menu mode",
                  ),
                ),
                onChanged: print,
                selectedItem: "Brazil",
              ),
              DropdownSearch<String>.multiSelection(
                items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                popupProps: PopupPropsMultiSelection.menu(
                  showSelectedItems: true,
                  disabledItemFn: (String s) => s.startsWith('I'),
                ),
                onChanged: print,
                selectedItems: ["Brazil"],
              ),

              //   SizedBox(height: 10),
              //  controller.selectedCountry.value.isEmpty
              //         ? Container()
              //         : Text(
              //             'Selected Country: ${controller.selectedCountry.value}',
              //             style: TextStyle(
              //                 fontSize: 18, fontWeight: FontWeight.bold),
              //           )

              // const Divider(),
              // Row(
              //   children: [
              //     Expanded(
              //       child: DropdownSearch<int>(
              //         items: [1, 2, 3, 4, 5, 6, 7],
              //       ),
              //     ),
              //     const Padding(padding: EdgeInsets.all(4)),
              //     Expanded(
              //       child: DropdownSearch<int>.multiSelection(
              //         clearButtonProps: const ClearButtonProps(isVisible: true),
              //         items: [1, 2, 3, 4, 5, 6, 7],
              //       ),
              //     )
              //   ],
              // ),

              // const Text("[simple examples for each mode]"),
              // const Divider(),
              // Row(
              //   children: [
              //     Expanded(
              //       child: DropdownSearch<int>(
              //         items: [1, 2, 3, 4, 5, 6, 7],
              //       ),
              //     ),
              //     const Padding(padding: EdgeInsets.all(4)),
              //     Expanded(
              //       child: DropdownSearch<int>.multiSelection(
              //         key: _popupCustomValidationKey,
              //         items: [1, 2, 3, 4, 5, 6, 7],
              //         popupProps: PopupPropsMultiSelection.dialog(
              //           validationWidgetBuilder: (ctx, selectedItems) {
              //             return Container(
              //               color: Colors.blue[200],
              //               height: 56,
              //               child: Align(
              //                 alignment: Alignment.center,
              //                 child: MaterialButton(
              //                   child: const Text('OK'),
              //                   onPressed: () {
              //                     _popupCustomValidationKey.currentState
              //                         ?.popupOnValidate();
              //                   },
              //                 ),
              //               ),
              //             );
              //           },
              //         ),
              //       ),
              //     )
              //   ],
              // ),

              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<int>(
                      items: [1, 2, 3, 4, 5, 6, 7],
                      dropdownDecoratorProps: const DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "BottomSheet mode",
                          hintText: "Select an Int",
                        ),
                      ),
                      popupProps: const PopupProps.bottomSheet(
                          bottomSheetProps: BottomSheetProps(
                              elevation: 16,
                              backgroundColor: Color(0xFFAADCEE))),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(4)),
                  Expanded(
                    child: DropdownSearch<int>(
                      items: [1, 2, 3, 4, 5, 6, 7],
                      dropdownDecoratorProps: const DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Modal mode",
                          hintText: "Select an Int",
                          filled: true,
                        ),
                      ),
                      popupProps: PopupPropsMultiSelection.modalBottomSheet(
                        disabledItemFn: (int i) => i <= 3,
                      ),
                    ),
                  )
                ],
              ),

              ///////////////////

              CustomDropDownSearch(controller: controller),
              const SizedBox(height: 10),
             
            ],
          )
          //;
          // }),
          ),
    );
  }
}

class CustomDropDownSearch extends StatelessWidget {
  const CustomDropDownSearch({
    super.key,
    required this.controller,
  });
  final CountryController controller;
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      dropdownDecoratorProps: const DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: "Select a country",
          hintText: " Country",
        ),
      ),
      popupProps: PopupProps.menu(
          title: const Center(child: Text(' Select your country')),
          showSearchBox: true,
          fit: FlexFit.tight,
          showSelectedItems: true,
          isFilterOnline: true,
          searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)),
            hintText: ' Search country',
          ))
          // searchDelay: Duration(seconds: 1)
          //comment this if you want that the items do not takes all available height
          // constraints: BoxConstraints.tight(Size.zero),
          ),
      items: controller.countries,
      onChanged: (value) {
        controller.selectedCountry.value = value!;
      },
    );
  }
}
