import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecurityStorageProvider extends ChangeNotifier {
  late final FlutterSecureStorage _storage;

  FlutterSecureStorage get storage => _storage;

  SecurityStorageProvider(FlutterSecureStorage storage) {
    _storage = storage;
  }
}
