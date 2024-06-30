import '../../domain/repositories/auth_repository.dart';
import '../models/login_request_model.dart';
import '../providers/auth_provider.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthProvider provider;

  AuthRepositoryImpl(this.provider);

  @override
  Future<bool> login(LoginRequestModel request) async {
    return await provider.login(request);
  }
}
