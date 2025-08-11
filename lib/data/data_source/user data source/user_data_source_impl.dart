import 'dart:convert';

import 'package:clean_archi/data/data_source/user%20data%20source/user_data_source.dart';
import 'package:clean_archi/data/model/user_model.dart';
import 'package:clean_archi/domain/entities/auth_entity.dart';
import 'package:clean_archi/domain/entities/user_entity.dart';
import 'package:dio/dio.dart' as dio;

final baseURL = "http://10.227.245.200:3000/";

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<UserModel> addUser(AuthEntity auth) async {
    dio.Response response = await dio.Dio().post(
      "$baseURL/api/auth/register",
      data: {"email": auth.email, "password": auth.password},
    );
    final decodedData = jsonDecode(jsonEncode(response.data['user']));
    UserModel userModel = UserModel.fromJson(decodedData);
    return userModel;
  }

  @override
  Future<UserModel> getUser(AuthEntity auth) async {
    dio.Response response = await dio.Dio().get(
      "${baseURL}api/auth/login",
      data: {'email': auth.email, "password": auth.password},
    );
    final decodedData = jsonDecode(jsonEncode(response.data['user']));
    UserModel userModel = UserModel.fromJson(decodedData);
    return userModel;
  }

  @override
  Future<UserModel> updateUser(UserEntity user) async {
    dio.Response res = await dio.Dio().put(
      '${baseURL}api/auth/update',
      data: {
        'name': user.name,
        'image': user.image,
        '_id': user.id,
        'paymentMethod': {
          "expiryDate": user.paymentMethod.expiryDate,
          "cvv": user.paymentMethod.cvv,
          "cardHolderNumber": user.paymentMethod.number,
          "cardHolderName": user.paymentMethod.holderName,
        },
      },
    );
    final decodedData = jsonDecode(jsonEncode(res.data));
    UserModel userRes = UserModel.fromJson(decodedData['user']);
    return userRes;
  }

  @override
  Future<UserModel> getUserWithId(String id) async {
    dio.Response response = await dio.Dio().get(
      "${baseURL}api/auth/loginWithId",
      data: {"_id": id},
    );
    final decodedData = jsonDecode(jsonEncode(response.data['user']));
    UserModel userModel = UserModel.fromJson(decodedData);
    return userModel;
  }
}
