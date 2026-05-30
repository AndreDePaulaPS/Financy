import 'package:flutter_finance_app/core/session/domain/entities/session.dart';

abstract interface class ISessionManager {

    Future<void> save(Session session);
    Session? loadSession();
    Future<void> clearSession(); 
  
}