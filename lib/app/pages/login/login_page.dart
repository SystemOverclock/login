import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/app/authentication.dart';
import 'package:login/app/components/custom_input.dart';
import 'package:login/app/pages/login/login_cubit.dart';
import 'package:formz/formz.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: BlocProvider(
      create: (_) => LoginCubit(context.read<AuthenticationRepository>()),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage ?? 'Erro no autenticação.'),
                ),
              );
          }
        },
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromRGBO(255, 255, 255, 1),
            Color.fromARGB(255, 152, 190, 233),
            Theme.of(context).primaryColor
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/logo/logo.png', width: (width * 0.5)),
                Padding(
                    padding: EdgeInsets.only(
                        top: (height * 0.15),
                        left: (width * 0.05),
                        right: (width * 0.05)),
                    child: CustomInputWidget(
                        height: height,
                        width: width,
                        icon: Icons.person,
                        placeholder: 'usuário')),
                Padding(
                    padding: EdgeInsets.only(
                        top: (height * 0.05),
                        left: (width * 0.05),
                        right: (width * 0.05)),
                    child: CustomInputWidget(
                        height: height,
                        width: width,
                        icon: Icons.key,
                        placeholder: 'senha')),
                Padding(
                    padding: EdgeInsets.only(
                        top: (height * 0.15),
                        left: (width * 0.2),
                        right: (width * 0.2)),
                    child: OutlinedButton(
                      onPressed: () => {},
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: (width * 0.15), right: (width * 0.15)),
                        child: Text('LOGIN'),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: (height * 0.05),
                        left: (width * 0.05),
                        right: (width * 0.05)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(219, 74, 57, 1)),
                            width: 50,
                            height: 50,
                            child: Image.asset('assets/icon/google.png')),
                        Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(57, 86, 156, 1)),
                            width: 50,
                            height: 50,
                            child: Image.asset('assets/icon/facebook.png')),
                        Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.black),
                            width: 50,
                            height: 50,
                            child: Image.asset('assets/icon/apple.png')),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
