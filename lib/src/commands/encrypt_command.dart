import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

class EncryptCommand extends Command<int> {
  EncryptCommand({
    required Logger logger,
  }) : _logger = logger {
    argParser.addFlag(
      'encryptedValue',
      abbr: 'e',
      negatable: false,
      help: 'The value to encrypting',
    );
  }

  final Logger _logger;

  @override
  String get description => "Put a sensitive data and return an encrypted data ASCII format";

  @override
  String get name => "encrypted";

  @override
  Future<int> run() async {
    if (argResults?['encryptedValue'] == true) {
      if (argResults!.rest.isEmpty) {
        _logger.err("You need to specify an ASCII format key");
        return ExitCode.usage.code;
      }
      print("the encrypted key for ${argResults?.rest} is : ");
      Uint8List encode = ascii.encode(argResults?.rest.toString().replaceAll(RegExp(r"\[|\]"), "") ?? "");

      print(encode);

      return ExitCode.success.code;
    }
    return ExitCode.usage.code;
  }
}
