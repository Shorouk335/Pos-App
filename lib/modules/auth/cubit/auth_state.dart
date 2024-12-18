part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitialState extends AuthState {}
final class LoadingLoginState extends AuthState {}
final class SuccessLoginState extends AuthState {}
final class ErrorLoginState extends AuthState {
  final String errorMsg;
  ErrorLoginState({required this.errorMsg}); }
