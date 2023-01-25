import 'package:encrypted_key/src/command_runner.dart';

const valueToEncrypt = 'value-to-encrypt';
void main(List<String> arguments) {
  EncryptedKeyCommandRunner().run(arguments);
}
