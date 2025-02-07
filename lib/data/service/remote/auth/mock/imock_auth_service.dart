import 'package:asset_tracker/data/service/remote/auth/iauth_service.dart';
import 'package:asset_tracker/domain/entities/auth/user_login_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

//MockService'in imzalarını taşıyan IMockAuthService sınıfı
//bu sınıfta bir daha ekstaradan model sınıfı tanımlamak yerine kendi
//oluşturduğum mockUserCredentinal sınıfını kullanacağım
//o yüzden UserCredentinal? type ını vermekte bir problem yok.
//farklı durumlarda UserCred yerine uid ve token parametreleri içeren
//CustomAuthModel sınıfı da oluşturabilir.

abstract interface class IMockAuthService implements IAuthService {
  @override
  Future<UserCredential>? signInUser(UserLoginEntity entity);
}
