import 'dart:async';
import 'dart:convert';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

class DecryptCommand extends Command<int> {
  DecryptCommand({
    required Logger logger,
  }) : _logger = logger {
    argParser.addFlag(
      'decryptedValue',
      abbr: 'd',
      negatable: false,
      help: 'The value to decrypting',
    );
  }

  final Logger _logger;

  @override
  String get description => "Put a crypting data in ASCII format and return a raw data";

  @override
  String get name => "decrypted";

  @override
  Future<int> run() async {
    if (argResults?['decryptedValue'] == true) {
      if (argResults!.rest.isEmpty) {
        _logger.err("You need to specify an ASCII format key");
        return ExitCode.usage.code;
      }
      List<int> bytes = [];
      // Reformat value str with comma and throw error if it's not a number
      for (String result in argResults?.rest ?? []) {
        List<String> reformatString = [];
        reformatString.add(result.split(",").first);
        for (String stringToInt in reformatString) {
          RegExp regexAscii = RegExp(r'^[0-9]*$');
          if (!regexAscii.hasMatch(stringToInt)) {
            _logger.err("The input is not a number");
            return ExitCode.usage.code;
          }
          bytes.add(int.parse(stringToInt));
        }
      }
      try {
        String decode = ascii.decode(bytes);
        print("the decrypted value for $bytes is : ");
        print(decode);
        return ExitCode.success.code;
      } on FormatException catch (e) {
        _logger.err(e.message);
        return ExitCode.usage.code;
      }
    }
    return ExitCode.usage.code;
  }
}
