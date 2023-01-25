import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:args/args.dart';
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
      {
        List<int> bytes = [];
        print("the decrypted value for ${argResults?.rest} is : ");

        // Reformat value str with comma
        for (String result in argResults?.rest ?? []) {
          List<String> reformatString = [];
          reformatString.add(result.split(",").first);
          for (String stringToInt in reformatString) {
            bytes.add(int.parse(stringToInt));
          }
        }

        String decode = ascii.decode(bytes);

        print(decode);

        return ExitCode.success.code;
      }
    }
    return ExitCode.usage.code;
  }
}
