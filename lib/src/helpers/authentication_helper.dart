
import 'package:form_f/src/helpers/storage_helper.dart';
import 'package:form_f/src/helpers/storage_keys.dart';

class AuthenticationHelper {
  Future<String?> getUserId() async {
    return await StorageHelper.readData(StorageKeys.userId.name);
  }
  Future<void> setUserId(String userId) async{
    StorageHelper.writeData(StorageKeys.userId.name, userId);
  }

  Future <String?>getUserTokenId()async {
    return await StorageHelper.readData(StorageKeys.userTokenId.name);
  }
  Future<void> setUserToken(String userToken) async{
    StorageHelper.writeData(StorageKeys.userTokenId.name, userToken);
  }
}