import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:portfolio_builder_ai/global.dart';
import 'package:portfolio_builder_ai/network/models/user_model.dart';
import 'package:portfolio_builder_ai/network/service/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignInWithGoogle>(_onSignInWithGoogle);
    on<SignInWithGithub>(_onSignInWithGithub);
    on<SignInWithLinkedIn>(_onSignInWithLinkedin);
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthService _service = AuthService();

  _onSignInWithGoogle(SignInWithGoogle event, Emitter emit)async{
    emit(Loading());
    try{
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      googleProvider.setCustomParameters({
        'prompt': 'select_account',
      });
      UserCredential authResult = await _auth.signInWithPopup(googleProvider);
      final User? user = authResult.user;

      emit(SignInSuccess());

      final response = await _service.createUser(
        firstName: user!.displayName??'New', 
        lastName: user.displayName??'User', 
        email: user.email!, 
        uid: user.uid,
        picture: user.photoURL
      );

      Global.user = UserModel.fromMap(response['user']);
      Global.accessToken = response['accessToken'];
      Global.refreshToken = response['refreshToken'];

      emit(UserDataFetched());
      
    }catch(error){
      emit(Failure());
    }
  }

  _onSignInWithGithub(SignInWithGithub event, Emitter emit)async{
    emit(Loading());
    try{
      GithubAuthProvider githubProvider = GithubAuthProvider();
      githubProvider.setCustomParameters({
        'prompt': 'select_account',
      });
      final UserCredential authResult = await _auth.signInWithPopup(githubProvider);
      final User? user = authResult.user;

      emit(SignInSuccess());
      
    }catch(error){
      emit(Failure());
    }
  }

  _onSignInWithLinkedin(SignInWithLinkedIn event, Emitter emit)async{
    emit(Loading());
    try{
      
    }catch(error){
      emit(Failure());
    } 
  }
}
