import 'package:hive_flutter/hive_flutter.dart';


class LocalDB {

  
  static Future init() async{
    await Hive.initFlutter();
    
    await Future.wait([
      Hive.openBox('user'),
      Hive.openBox('credentials')
    ]);
  }


  static final session = Hive.box('credentials');

  static saveAccessToken(value)=>session.put('accessToken', value);
  static saveRefreshToken(value)=>session.put('refreshToken', value);

  static getAccessToken()=>(session.get('accessToken'));
  static getRefreshToken()=>(session.get('refreshToken'));

  static final user = Hive.box('user');

  static saveTheme(value)=>user.put('theme', value);
  static getTheme()=>user.get('theme');

  static saveLanguage(value)=>user.put('language', value);
  static getLanaguage()=>user.get('language');

  static saveLogin(value)=>user.put('isLogin', value);
  static isLogin()=>user.get('isLogin');

  static enableLock(value)=>user.put('lock', value);
  static isLockEnabled()=>user.get('lock');
  static saveAccessCode(value)=>user.put('accessCode', value);
  static getAccessCode()=>user.get('accessCode');

  static clearDB(){
    user.clear();
    session.clear();
  }

}