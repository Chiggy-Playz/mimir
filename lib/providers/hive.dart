import 'package:mimir/models/credentials.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'hive.g.dart';

@Riverpod(keepAlive: true)
Future<HiveDB> hiveDb(HiveDbRef ref) async {
  return HiveDB.create();
}

// I have no clue how to do this, but stackoverflow guy suggested this -_-
class HiveDB {
  late Box _prefsBox;
  late Box _credentialsBox;

  HiveDB._create();

  static Future<HiveDB> create() async {
    final component = HiveDB._create();
    await component._init();
    return component;
  }

  _init() async {
    _registerAdapters();
    _credentialsBox = await Hive.openBox('credentials');
    _prefsBox = await Hive.openBox('preferences');
  }

  _registerAdapters() {}

  Future<void> saveCredentials(String serverAddress, String apiKey) async {
    await _credentialsBox.put('serverAddress', serverAddress);
    await _credentialsBox.put('apiKey', apiKey);
  }

  Future<Credentials?> getCredentials() async {
    final serverAddress = await _credentialsBox.get('serverAddress');
    final apiKey = await _credentialsBox.get('apiKey');
    if (serverAddress == null || apiKey == null) {
      return null;
    }
    return Credentials(
      serverAddress: serverAddress,
      apiKey: apiKey,
    );
  }
}
