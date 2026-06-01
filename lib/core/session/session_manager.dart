import 'package:flutter_finance_app/core/session/domain/contracts/i_session_manager.dart';
import 'package:flutter_finance_app/core/session/domain/entities/session.dart';

class SessionManager implements ISessionManager {
  Session? _session;

  @override
  Future<void> clearSession() async {
    _session = null;
  }

  @override
  Session? loadSession() {
    return _session;
  }

  @override
  Future<void> save(Session session) async {
    _session = session;
  }

  @override
  bool get isLogged  {
    if(loadSession() != null){
      return true;
    }
    return false;
  }
}
