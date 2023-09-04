part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class Loading extends AuthState {}

class SignInSuccess extends AuthState {}

class UserDataFetched extends AuthState {}

class Failure extends AuthState {}