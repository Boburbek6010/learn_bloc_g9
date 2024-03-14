import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';





class AuthBloc extends Bloc<AuthEvent, AuthState> {

  AuthBloc():super(AuthInitial()){


    on<SignUpEvent>((event, emit) async {
      String eventValue = validation(event);
      if(eventValue != ''){
        emit(ErrorState(eventValue));
      }else{
        emit(IsLoadingState());
        await Future.delayed(const Duration(seconds: 5), () async {
          emit(SuccessState());
        });
      }

    });


  }


  String validation(SignUpEvent event) {
    if (event.fullName?.isEmpty == true) {
      return 'Please Enter Your FullName';
    }
    if (event.email?.isEmpty == true) {
      return 'Please Enter Your Email-id';
    }
    if (event.password?.isEmpty == true) {
      return 'Please Enter Your Password';
    }
    if (event.phoneNumber?.isEmpty == true) {
      return 'Please Enter Your Contact Number';
    }
    return '';
  }

}
