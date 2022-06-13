import 'package:flutter/material.dart';

import '../models/user_info.dart';
import '../services/backend_service.dart';
import 'mock_provider.dart';

class UserInfoProvider with ChangeNotifier {
  final BackendService backendService;
  final MockProvider mockProvider;
  UserInfo? _userInfo;

  UserInfoProvider({
    required this.backendService,
    required this.mockProvider,
  });

  void updateUserInfo(UserInfo Function(UserInfo) updateUser) {
    _userInfo = updateUser(userInfo!);
    notifyListeners();
  }

  UserInfo? get userInfo {
    _userInfo ??= mockProvider.userInfo; // TODO access backend
    return _userInfo;
  }

  // TODO add check method if userInfo is stored in backend
}
