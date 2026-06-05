import 'dart:convert';

import 'package:flutter_finance_app/core/local_storage/local_storage_keys.dart';
import 'package:flutter_finance_app/core/session/data/dto/session_dto.dart';
import 'package:flutter_finance_app/core/session/data/mapper/session_mapper.dart';
import 'package:flutter_finance_app/core/session/domain/contract/i_local_storage.dart';
import 'package:flutter_finance_app/core/session/domain/contract/i_session_manager.dart';
class RestoreSessionUsecase {
  final ISessionManager _sessionManager;
  final ILocalStorage _storage;

  RestoreSessionUsecase(this._sessionManager, this._storage);


  Future<void> call() async {

    final sessionRaw = await _storage.load(LocalStorageKeys.session);

    if(sessionRaw == null) return;

    final json = jsonDecode(sessionRaw);

    final sessionDTO = SessionDto.fromJson(json);

    final session = sessionDTO.toDomain();

    await _sessionManager.save(session);
  }

 
}