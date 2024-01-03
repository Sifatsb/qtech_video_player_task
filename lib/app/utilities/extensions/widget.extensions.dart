import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


extension WidgetExtension on num {
  Widget get horizontalSpacing => SizedBox(width: toDouble());

  Widget get verticalSpacing => SizedBox(height: toDouble());

  BorderRadius get circularRadius => BorderRadius.circular(toDouble());
}




// DateTime originalDate = DateTime.parse(controller.videosList[index].dateAndTime ?? '');
// String formattedDate = DateFormat('MMM d, yyyy').format(originalDate);




extension StringExtension on String {
  // ignore: non_constant_identifier_names
  String get dd_mm_yyyy => DateFormat('dd/MM/yyyy').format(
    DateFormat(this).parse(
      toString(),
    ),
  );

  // ignore: non_constant_identifier_names
  String get mmm_dd_yyyy => DateFormat('MMM dd yyy').format(
    DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(
      toString(),
    ),
  );

  // ignore: non_constant_identifier_names
  String get dd_mmm_yyyy => DateFormat('dd MMM yyy').format(
    DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(
      toString(),
    ),
  );

}