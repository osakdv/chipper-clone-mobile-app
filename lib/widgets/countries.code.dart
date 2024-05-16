// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:country_list_pick/country_list_pick.dart';

// CountryListPick(
//         appBar: AppBar(
//           backgroundColor: Colors.blue,
//           title: Text('Choisir un pays'),
//         ),
        
//         // if you need custome picker use this
//         // pickerBuilder: (context, CountryCode countryCode){
//         //   return Row(
//         //     children: [
//         //       Image.asset(
//         //         countryCode.flagUri,
//         //         package: 'country_list_pick',
//         //       ),
//         //       Text(countryCode.code),
//         //       Text(countryCode.dialCode),
//         //     ],
//         //   );
//         // },

//         // To disable option set to false
//         theme: CountryTheme(
//           isShowFlag: true,
//           isShowTitle: true,
//           isShowCode: true,
//           isDownIcon: true,
//           showEnglishName: true,
//         ),
//         // Set default value
//         initialSelection: '+62',
//         // or
//         // initialSelection: 'US'
//         onChanged: (CountryCode code) {
//           print(code.name);
//           print(code.code);
//           print(code.dialCode);
//           print(code.flagUri);
//         },
//         // Whether to allow the widget to set a custom UI overlay
//         useUiOverlay: true,
//         // Whether the country list should be wrapped in a SafeArea
//         useSafeArea: false
//         ),