import 'dart:convert';
import 'dart:typed_data';

Uint8List encrypted(String valueToEncrypted) {
  Uint8List encode = ascii.encode(valueToEncrypted);

  return encode;
}
