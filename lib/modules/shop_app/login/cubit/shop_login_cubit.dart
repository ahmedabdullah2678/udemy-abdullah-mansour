import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:structure/shared/network/end_point.dart';
import 'package:structure/shared/network/remote/dio_helper.dart';
part 'shop_login_state.dart';

class ShopLoginCubit extends Cubit<ShopLoginState> {
  ShopLoginCubit() : super(ShopLoginInitial());

  static ShopLoginCubit get(context) => BlocProvider.of(context);
  IconData suffix = Icons.visibility_outlined;
  bool isPasswordShow = true;

  void changePasswordVisibility() {
    print('Pressed');
    isPasswordShow = !isPasswordShow;
    suffix = isPasswordShow
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ShopLoginChangePasswordVisibility());
  }

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(ShopLoginLoading());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      emit(ShopLoginSucess());
    }).catchError((e) {
      print(e.toString());
      emit(ShopLoginError(e.toString()));
    });
  }
}
