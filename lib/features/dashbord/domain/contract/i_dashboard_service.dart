import 'package:flutter_finance_app/features/dashbord/data/dto/dashboard_dto.dart';
import 'package:flutter_finance_app/shared/result/result.dart';

abstract interface class IDashboardService {
  Future<Result<DashboardDto, Exception>> loadDashboard();
}
