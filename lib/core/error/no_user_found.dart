
import 'package:clean_archi/core/error/failure.dart';

class NoUserFound extends Failure {
  NoUserFound([String? message]) : super(message ?? 'No User Found');
}