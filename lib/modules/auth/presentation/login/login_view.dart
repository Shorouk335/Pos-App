import 'package:e_ticket_app/core/api_service/helper/custom_snak_bar.dart';
import 'package:e_ticket_app/core/app_utils/validation.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/auth/cubit/auth_cubit.dart';
import 'package:e_ticket_app/modules/auth/domain/request/login_request_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:e_ticket_app/shared/widgets/customButton.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>(); 
  LoginRequestModel  loginRequestModel = LoginRequestModel() ; 
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthCubit(),
      child: BlocConsumer <AuthCubit, AuthState>(
        listener: (context, state) {
         if(state is SuccessLoginState){
          ShowCustomSnackBar(context).success(message: "login_success".tr());
          NavigationService.goNamed(AppRouter.layoutRoute);
         }
         if(state is ErrorLoginState){
         ShowCustomSnackBar(context).failure(message: state.errorMsg);
         }
        },
        builder: (context , state) {
          return   Scaffold(
          appBar: CustomDarkAppBar(
            title: "login".tr(),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    CustomTextFormField(
                      labelText: "email".tr(),
                      suffixWidget: Icon(
                        Icons.email_outlined,
                        color: AppColors.normalTextGrey(context),
                        size: 25.0,
                      ),
                      onChanged: (s){
                       loginRequestModel.email = s ; 
                      },
                      validator: CustomValidation.emailValidation,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextFormField(
                      isPassword: true,
                      obscureText: true,
                      labelText: "password".tr(),
                      onChanged: (s){
                        loginRequestModel.password = s ;
                      },
                      validator: CustomValidation.passwordValidation,
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    CustomButton(
                        onPressed: () {
                          if(formKey.currentState!.validate()){
                            AuthCubit.get(context).login(loginRequestModel: loginRequestModel);
                          }
                        },
                        text: "login".tr()),
                    const SizedBox(
                      height: 20.0,
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     NavigationService.pushNamed(
                    //         AppRouter.forgetPasswordRoute);
                    //   },
                    //   child: CustomText(
                    //       context: context,
                    //       text: "did_you_forget_your_password".tr(),
                    //       color: AppColors.onPrimary(context)),
                    // )
                  ],
                ),
              ),
            ),
          ),
        );
        }
        
       
      ),
    );
  }
}
