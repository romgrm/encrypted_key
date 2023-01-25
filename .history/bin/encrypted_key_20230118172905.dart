import 'package:encrypted_key/encrypted_key.dart' as encrypted_key;

void main(List<String> arguments) {
  print('Your input ${arguments.first} was encrypted to : ${encrypted_key.encrypted(arguments.first)}!');
}
