import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../../../config/screen_size.dart';
import '../../../utils/color_assets.dart';

class PickCountry extends StatelessWidget {
  const PickCountry({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.height(context) * 0.09,
      width: ScreenSize.width(context) * 0.6,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorAssets.kColor)),
      child: MaterialButton(
          onPressed: () {
            showCountryPicker(
                context: context,
                showPhoneCode: true,
                countryListTheme: CountryListThemeData(
                    inputDecoration: InputDecoration(
                      labelText: 'Search',
                      hintText: 'Start typing to search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0xFF8C98A8)
                              .withOpacity(0.2),
                        ),
                      ),
                    ),
                    searchTextStyle: const TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                    borderRadius: BorderRadius.circular(
                        10)),
                onSelect: (Country country) {
                  print(
                      'Select country: ${country
                          .displayName}');
                });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween,
            children: [
              const Text('Select your nation'),
              Icon(
                Icons.arrow_drop_down_outlined,
                color: ColorAssets.kColor,
              )
            ],
          )),
    );
  }
}
