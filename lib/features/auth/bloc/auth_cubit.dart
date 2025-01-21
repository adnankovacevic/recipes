import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/di.dart';
import 'package:recipes/features/auth/bloc/auth_state.dart';
import 'package:recipes/features/auth/repositories/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthLoading());

  AuthRepository get authRepository => locator.get<AuthRepository>();

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      await authRepository.login(email, password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> register(String email, String password) async {
    emit(AuthLoading());
    try {
      await authRepository.register(email, password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await authRepository.logout();
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
