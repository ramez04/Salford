

import 'package:clean_archi/data/model/user_model.dart';
import 'package:clean_archi/domain/entities/auth_entity.dart';
import 'package:clean_archi/domain/entities/user_entity.dart';

abstract class UserDataSource {
  Future<UserModel> addUser(AuthEntity user);
  Future<UserModel> updateUser(UserEntity user,);

  Future<UserModel> getUser(AuthEntity auth);
  Future<UserModel> getUserWithId(String id);
}

