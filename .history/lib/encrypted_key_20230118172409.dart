import 'dart:convert';
import 'dart:typed_data';

Uint8List encrypted() {
  Uint8List encode = ascii.encode("https://krakend-integration.ems.rancher.kosmos.fr/api/v1/bff-sko-app");

  return encode;

  print(ascii.decode(encode));
}
