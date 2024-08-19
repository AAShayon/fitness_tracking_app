import 'package:fitness_tracking_app/model/service/helper/local_storage_helper.dart';
import 'package:fitness_tracking_app/model/service/local/token.dart';

class TokenService implements TokenSystemService{
  static final TokenService _singleton=TokenService._internal();
   late final LocalStorageService? _localStorageService;
  factory TokenService(){
    return _singleton;
  }
  TokenService._internal(){
    _localStorageService = LocalStorageService();
  }
  // Future<void> setup() async {
  //   await _localStorageService!.setup();
  // }

  @override
  Future<void> deleteToken() async{
  await _localStorageService!.delete(key: 'token');
  }

  @override
  Future<String?> getToken() async{
   await _localStorageService!.read(key: 'token');
   return null;
  }

  @override
  Future<void> saveToken(String? token) async{
  if(token != null){
    await _localStorageService!.write(key: 'token', value: token.toString());
  }else{
    await _localStorageService!.delete(key: 'token');
  }
  }
}