import 'package:encrypted_key/encrypted_key.dart' as encrypted_key;
import 'package:args/args.dart';
import 'dart:convert';
import 'dart:io';

const valueToEncrypt = 'value-to-encrypt';
void main(List<String> arguments) {
  final parser = ArgParser()..addFlag(valueToEncrypt, negatable: false, abbr: 'v');

  ArgResults argResults = parser.parse(arguments);
  final paths = argResults.rest;

  print("arguments from results : $paths");
  print("rest from results : ${argResults.rest}");

  print('Your input ${arguments.first} was encrypted to : ${encrypted_key.encrypted(arguments.first)}!');
}
