part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class IsLoadingState extends AuthState{

}
class ErrorState extends AuthState{
  final String? error;
  ErrorState(this.error);
}
class SuccessState extends AuthState{}
