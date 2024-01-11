import 'package:get_storage/get_storage.dart';

class LocalStorage {
  final getStorageIns = GetStorage('local_storage');

  final bearerToken = 'bearerToken';

  String get getBearerToken => getStorageIns.read(bearerToken) ?? '';

  void setBearerToken({required String token}) =>
      getStorageIns.write(bearerToken, token);
}
