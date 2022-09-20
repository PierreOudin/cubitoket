import 'package:cubitoket/features/auth/domain/usecases/login/login_usecase.dart';
import 'package:cubitoket/features/auth/presentation/login/cubit/login_cubit.dart';
import 'package:cubitoket/features/auth/presentation/recoverypwd/view/recover_pwd_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _fieldVisible = false;
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fieldVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    final loginCubit = Modular.get<LoginCubit>();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          leading: IconButton(
            icon: const FaIcon(FontAwesomeIcons.xmark),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Image(
            image: AssetImage("assets/images/800px-Qulbutoké-HGSS.png"),
            width: 60,
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Connectez-vous avec vos identifiants",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildEmailFormWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildPasswordFormWidget(),
                  const SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      child: const Text(
                        "Mot de passe oublié ?",
                        style: TextStyle(color: Color(0xffF77F00)),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => const RecoverPwdPage())));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  BlocProvider(
                      create: (context) => loginCubit,
                      child: BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          if (state is LoginInitial) {
                            return ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffD62828),
                                  minimumSize: const Size.fromHeight(80),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 30)),
                              child: const Text("Connexion"),
                            );
                          }
                          if (state is LoginLoading) {
                            return ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffD62828),
                                  minimumSize: const Size.fromHeight(80),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 30)),
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                          if (state is LoginLoaded) {
                            return Center(
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/800px-Qulbutoké-HGSS.png",
                                    width: 100,
                                  ),
                                  Text(state.jwtTokenEntity.jwt)
                                ],
                              ),
                            );
                          }
                          if (state is LoginError) {
                            return Text(state.error);
                          }
                          return ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffD62828),
                                minimumSize: const Size.fromHeight(80),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                textStyle: const TextStyle(
                                    color: Colors.white, fontSize: 30)),
                            child: const Text("Connexion"),
                          );
                        },
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: const Text(
                      "Pas encore de compte ?",
                      style: TextStyle(color: Color(0xffF77F00)),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              const Expanded(
                child: Text(''),
              ),
              Column(
                children: const [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Mentions légales",
                        style: TextStyle(color: Color(0xffF77F00))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Protection des données personnelles",
                        style: TextStyle(color: Color(0xffF77F00))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Cookies",
                        style: TextStyle(color: Color(0xffF77F00))),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Widget _buildEmailFormWidget() {
    return TextFormField(
      controller: emailTextController,
      decoration: const InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(color: Colors.black),
        hintText: 'Enter your email',
        border: UnderlineInputBorder(),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffF77F00))),
      ),
    );
  }

  Widget _buildPasswordFormWidget() {
    return TextFormField(
      controller: passwordTextController,
      obscureText: !_fieldVisible,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: const TextStyle(color: Colors.black),
          hintText: 'Enter your password',
          border: const UnderlineInputBorder(),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffF77F00))),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _fieldVisible = !_fieldVisible;
                });
              },
              icon: FaIcon(
                !_fieldVisible
                    ? FontAwesomeIcons.eye
                    : FontAwesomeIcons.eyeSlash,
                color: Colors.black,
              ))),
    );
  }
}
