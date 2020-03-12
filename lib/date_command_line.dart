import 'package:intl/intl.dart';

  String formatDataComHora({int year,int month, int day, int hour, int minute}){
    var data = DateTime(year, month, day,hour,minute);
    var formattedDate = DateFormat('dd/MM/yyyy').add_Hm().format(data);
    return formattedDate;
  }
