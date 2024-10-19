



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/commons/functions/common_functions.dart';
import '../../../../core/routes/admin_routes.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/progress_loading_indicator.dart';
import '../../../../core/widgets/space_widget.dart';
import '../cubits/login_cubit/login_cubit.dart';
import '../widgets/dont_have_account_row.dart';
import '../widgets/email_login_text_field.dart';
import '../widgets/left_part_login_section.dart';
import '../widgets/login_button.dart';
import '../widgets/password_login_text_field.dart';
import '../widgets/terms_and_conditions_row.dart';

class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFF6EE,
      body: SafeArea(
            child: CustomScrollView(
              slivers:
              [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      const
                      Expanded(
                          child: ImageAdminLoginSection()),
                      Container(
                        width: 87.w,
                        color: AppColors.white,
                      ),
                      Expanded(
                      child: BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state)
                      {
                        handleLoginActionListener(state, context);
                      },
                      builder: (context, state)
                      {
                        return Form(
                          autovalidateMode: LoginCubit.get(context).loginAutoValidateMode,
                          key: LoginCubit.get(context).loginFormKey,
                          child: Container(
                              color: AppColors.white,
                              child: Padding(
                                padding: EdgeInsetsDirectional.only(end: 125.w,),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                   Spacer(),
                                    Text(
                                      'Welcome !',
                                      style: AppTextStyles.bold40(context)
                                          .copyWith(color: AppColors.c07143B),
                                    ),
                                    const SpaceWidget(
                                      height: 16,
                                    ),
                                    Text(
                                      'Welcome back, Please enter your details.',
                                      style: AppTextStyles.regular16(context)
                                          .copyWith(
                                        color: AppColors.c959895,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    const SpaceWidget(
                                      height: 52,
                                    ),
                                    EmailLoginTextField(loginCubit: LoginCubit.get(context)),
                                    const SpaceWidget(
                                      height: 52,
                                    ),
                                    PasswordLoginTextField(loginCubit: LoginCubit.get(context)),
                                    const SpaceWidget(
                                      height: 52,
                                    ),
                                    TermsAndConditionsRow(
                                        loginCubit: LoginCubit.get(context)),
                                    const SpaceWidget(
                                      height: 70,
                                    ),
                                    state is LoginLoadingState
                                        ? const Center(
                                            child: CustomCircularProgressLoadingIndicator())
                                        : LoginButton(
                                            loginCubit: LoginCubit.get(context)),
                                    const SpaceWidget(
                                      height: 70,
                                    ),
                                    const DontHaveAccountRow(),
                                    const Spacer(flex: 2,)
                                  ],
                                ),
                              )),
                        );
                      },
                    ),
                  ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
  }

  void handleLoginActionListener(LoginState state, BuildContext context)
  {
    if (state is LoginSuccessState)
    {
      buildScaffoldMessenger(
          context: context,
          msg: 'You logged in successfully',
          iconWidget: SvgPicture.asset(ImageConstants.checkCircleIcon),
          snackBarBehavior: SnackBarBehavior.floating);
      navigate(context: context, route: AdminRoutes.mainDashboardScreen,replacement: true);
    }
    if (state is LoginFailureState)
    {
      loginFailureListenerFun(state, context);
    }
  }

  void loginFailureListenerFun(LoginFailureState state, BuildContext context) {
    if (state.errorModel.error != null)
    {
      buildScaffoldMessenger(
        snackBarBehavior: SnackBarBehavior.floating,
        iconWidget: Icon(Icons.error_outline,color: AppColors.white,size: 25,),
          context: context,
          msg: state.errorModel.error!.toString().substring(1,
                  state.errorModel.error!.toString().length - 1));
    }
    else
    {
      buildScaffoldMessenger(
        snackBarBehavior: SnackBarBehavior.floating,
          iconWidget: Icon(Icons.error_outline,color: AppColors.white,size: 25,),
          context: context,
          msg: state.errorModel.errorMessage!);
    }
  }


}











