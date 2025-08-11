import 'package:clean_archi/core/error/failure.dart';

class UnexpectedFailure extends Failure{
  UnexpectedFailure([String? message]) : super(message ?? 'Unexpected error');
  
}