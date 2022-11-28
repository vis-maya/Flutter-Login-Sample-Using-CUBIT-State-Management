import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_f/src/cubit/authentication/authentication_repository.dart';
import 'package:form_f/src/helpers/authentication_helper.dart';
import 'package:form_f/src/models/api_response_model.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationRepository _repository = AuthenticationRepository();
  AuthenticationCubit() : super(AuthenticationInitial());

  login(String email, String password) async {
    emit(AuthenticationLoading());
    ApiResponseModel response = await _repository.login(email, password);
    if (response.status) {
      AuthenticationHelper().setUserToken(response.token!);
      emit(AuthenticationSuccess());
    } else {
      emit(AuthenticationFailure());
    }
  }
}
