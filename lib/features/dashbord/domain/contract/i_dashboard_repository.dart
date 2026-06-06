import 'package:flutter_finance_app/core/session/domain/entitie/session.dart';
import 'package:flutter_finance_app/features/dashbord/domain/entity/dashboard_entity.dart';
import 'package:flutter_finance_app/shared/result/result.dart';

abstract interface class IDashboardRepository {
  Future<Result<Session, Exception>> loadUser();
  Future<Result<DashboardEntity, Exception>> loadDashboard();
}