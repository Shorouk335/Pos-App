import 'package:e_ticket_app/modules/auth/domain/repository/auth_repo.dart';
import 'package:e_ticket_app/modules/auth/domain/request/login_request_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  static AuthCubit get(context) => BlocProvider.of(context);

  Future login({required LoginRequestModel loginRequestModel}) async {
    emit(LoadingLoginState());
    var result = await AuthRepo().login(loginData: loginRequestModel);
    result.fold(
      (failure) => emit(ErrorLoginState(errorMsg: failure.errorMessage)),
      (success) => emit(SuccessLoginState()),
    );
  }
}
