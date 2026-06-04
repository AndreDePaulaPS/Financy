import 'package:flutter_finance_app/core/session/domain/entities/session.dart';
import 'package:flutter_finance_app/shared/result/result.dart';

abstract interface class IHomeRepository {
  Future<Result<Session, Exception>> loadUser();
}