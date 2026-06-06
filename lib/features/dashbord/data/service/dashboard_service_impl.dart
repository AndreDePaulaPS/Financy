import 'package:dio/dio.dart';
import 'package:flutter_finance_app/features/dashbord/data/dto/dashboard_dto.dart';
import 'package:flutter_finance_app/features/dashbord/domain/contract/i_dashboard_service.dart';
import 'package:flutter_finance_app/shared/exception/app_exception.dart';
import 'package:flutter_finance_app/shared/result/result.dart';

class DashboardServiceImpl implements IDashboardService{
  final Dio _dio;

  DashboardServiceImpl(this._dio);

  @override
  Future<Result<DashboardDto, Exception>> loadDashboard() async {
    try {
      final response = await _dio.get("/dashboard");
      if(response.statusCode == 200){
        final dto = DashboardDto.fromJson(response.data);
        return Success(dto);
      }
      return Failure(AppException(mensagem: response.data));
    } on DioException catch (e){
      return Failure(AppException(mensagem: e.toString()));
    }
  }
}