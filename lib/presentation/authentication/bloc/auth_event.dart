part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInWithGoogle extends AuthEvent {}

class SignInWithGithub extends AuthEvent {}

class SignInWithLinkedIn extends AuthEvent {}