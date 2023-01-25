import 'dart:convert';

void encrypted() {
  var encode = ascii.encode("https://krakend-integration.ems.rancher.kosmos.fr/api/v1/bff-sko-app");

  print(encode);

  print(ascii.decode(encode));
}
