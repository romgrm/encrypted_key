# Encrypted_key 🔐

A Dart CLI for **encrypting sensitive data** in ASCII format / decrypting ASCII key to raw string. 

The goal is to **never write raw sensitive data into the code** but to generate it with this CLI and inject it via a CI, like bitrise. 

---

## Getting Started 🚀

From [pub](https://pub.dev), activate globally via:

```sh
dart pub global activate encrypted_key
```

Or locally with forking repo via:

```sh
dart pub global activate --source=path <path to this package>
```

---

## Usage ⚒️

```sh
# Encrypting command
$ encrypted_key encrypt -e <value to encrypt>

# Decrypting command
$ encrypted_key decrypt -d <ASCII to decrypt>

# Show CLI version
$ encrypted_key --version

# Show usage help
$ encrypted_key --help
```

---

## Tests 

*test aren't implemented yet, but will be soon*