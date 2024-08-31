



import 'package:intl/intl.dart';

String dateFormat(){

  DateTime date = DateTime.now();
  String formatDate = DateFormat('MMM d, yyyy').format(date);


  return formatDate;
  
}