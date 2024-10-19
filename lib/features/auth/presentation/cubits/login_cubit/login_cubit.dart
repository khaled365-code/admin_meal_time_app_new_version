
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/database/errors/error_model.dart';
import '../../../data/repos/auth_repo_implementation.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState>


{
  LoginCubit({required this.authRepoImplementation}) : super(LoginInitial());

  static LoginCubit get(context)=>BlocProvider.of(context);


  final AuthRepoImplementation authRepoImplementation;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey();

  AutovalidateMode loginAutoValidateMode = AutovalidateMode.disabled;


  activateValidateMode()
  {
    loginAutoValidateMode=AutovalidateMode.always;
    emit(ActivateValidateMode());
  }


  IconData suffixIcon = Icons.visibility_off;
  bool passwordSecureText = true;

  changeEyeShape()
  {
    if (suffixIcon == Icons.visibility_off)
    {
      suffixIcon = Icons.visibility;
      passwordSecureText = false;
    }
    else
    {
      suffixIcon = Icons.visibility_off;
      passwordSecureText = true;
    }

    emit(ChangePasswordEyeShape());
  }

  bool termsCheckBoxValue=false;
  changeTermsCheckBoxValue()
  {
    termsCheckBoxValue=!termsCheckBoxValue;
    emit(CheckBoxChangedState());

  }

  loginFun({required String email,required String password}) async
  {
    emit(LoginLoadingState());

    final result = await authRepoImplementation.adminLogin(email: email, password:password);

    result.fold((errorModel)
    {
      emit(LoginFailureState(errorModel));
    }, (message)
    {
      emit(LoginSuccessState(message));
    });


  }


}