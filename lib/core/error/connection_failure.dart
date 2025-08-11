import 'package:clean_archi/core/error/failure.dart';

class ConnectionFailure extends Failure {
  ConnectionFailure([String? message]) : super(message ?? 'No internet connection');
}