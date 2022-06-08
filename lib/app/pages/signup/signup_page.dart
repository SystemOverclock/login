import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/app/authentication.dart';
import 'package:login/app/components/custom_input.dart';
import 'package:login/app/pages/signup/sign_up_cubit.dart';
import 'package:formz/formz.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);
  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: BlocProvider(
      create: (_) => SignUpCubit(context.read<AuthenticationRepository>()),
      child: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state.status.isSubmissionSuccess) {
            Navigator.of(context).pop();
          } else if (state.status.isSubmissionFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                    content: Text(
                        state.errorMessage ?? 'Ocorreu um erro no cadastro.')),
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
                        placeholder: 'senha'))
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
