import '../../data/models/login_request_model.dart';

abstract class AuthRepository {
  Future<bool> login(LoginRequestModel request);
}
