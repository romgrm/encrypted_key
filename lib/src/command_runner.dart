import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:yaml/yaml.dart';

import 'package:encrypted_key/src/commands/decrypt_command.dart';
import 'package:encrypted_key/src/commands/encrypt_command.dart';

const executableName = 'encrypted_key';
const packageName = 'encrypted_key';
const description = 'A Dart CLI for encrypting sensitive data in ASCII format';

class EncryptedKeyCommandRunner extends CommandRunner<int> {
  EncryptedKeyCommandRunner({
    Logger? logger,
  })  : _logger = logger ?? Logger(),
        super(executableName, description) {
    argParser.addFlag(
      'version',
      abbr: 'v',
      negatable: false,
      help: 'Print the current version.',
    );
    addCommand(EncryptCommand(logger: _logger));
    addCommand(DecryptCommand(logger: _logger));
  }

  final Logger _logger;

  @override
  void printUsage() => _logger.info(usage);

  @override
  Future<int> run(Iterable<String> args) async {
    final topLevelResults = parse(args);

    if (topLevelResults['version'] == true) {
      File f = File("./pubspec.yaml");
      String version = "";
      await f.readAsString().then((value) {
        Map yaml = loadYaml(value);
        version = yaml['version'];
      });
      _logger.info(version);

      return ExitCode.success.code;
    }
    try {
      runCommand(topLevelResults);
    } catch (e) {
      _logger.err("$e");
    }
    return ExitCode.usage.code;
  }
}
