part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignUpEvent extends AuthEvent{
  final String? fullName;
  final String? email;
  final String? password;
  final String? phoneNumber;
  SignUpEvent({this.email, this.password, this.fullName, this.phoneNumber});
}

class SignInEvent extends AuthEvent{
  final String? email;
  final String? password;
  SignInEvent({this.email, this.password});
}
