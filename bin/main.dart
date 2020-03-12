import 'dart:io';
import 'package:date_command_line/date_command_line.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
Future<void> main(List<String> arguments) async {
  stdout.writeln('Bem-vindo ao relógio mundial!');
  String opcoes;
  var regioes = await http.get
  ('http://worldtimeapi.org/api/timezone/');
  opcoes = regioes.body;
  stdout.writeln(opcoes.replaceAll('[', '').replaceAll(']', '').replaceAll('",', '"\n'));
  stdout.writeln('Copie uma das linhas acima e cole abaixo para descobrir o horário da região:');
  String regiao;
  regiao = stdin.readLineSync();
  var response = await http.get
  ('http://worldtimeapi.org/api/timezone/${regiao.replaceAll('"', '').replaceAll(',', '').trim()}');
  Map dados = json.decode(response.body);
  if(dados['error'] == null){
  var data_atual = DateTime.tryParse(dados['datetime']).add(
    Duration(hours: int.parse(dados['abbreviation'].toString())));
  String formattedDate;
  formattedDate = formatDataComHora(
    year: data_atual.year,
    month: data_atual.month,
    day: data_atual.day,
    hour: data_atual.hour,
    minute: data_atual.minute
    );
    stdout.writeln('Resultado: $formattedDate.\nPressione Enter para fechar o programa.');
    stdin.readLineSync();
  }else{
     stdout.writeln('Tente novamente com uma região válida.\nPressione enter para sair.');
     stdin.readLineSync();
  }
}
