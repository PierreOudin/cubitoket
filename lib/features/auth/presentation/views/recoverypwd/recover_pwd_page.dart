import 'package:cubitoket/features/auth/presentation/views/recoverypwd/recover_pwd_message.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RecoverPwdPage extends StatefulWidget {
  const RecoverPwdPage({super.key});

  @override
  State<RecoverPwdPage> createState() => _RecoverPwdPageState();
}

class _RecoverPwdPageState extends State<RecoverPwdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
            icon: const FaIcon(FontAwesomeIcons.chevronLeft),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            'Mot de passe oublié',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: Column(children: [
            const Text(
              "Vous allez recevoir un e-mail allant vous permettre de modifier votre mot de passe",
              textAlign: TextAlign.center,
            ),
            _buildEmailFormWidget(),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (((context) =>
                            const RecoverPwdMessagePage()))));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff003049),
                  minimumSize: const Size.fromHeight(80),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  textStyle:
                      const TextStyle(color: Colors.white, fontSize: 30)),
              child: const Text("Continuer"),
            ),
            const Spacer(),
            Image.asset("assets/images/Good_food_logo1.png")
          ]),
        ));
  }

  Widget _buildEmailFormWidget() {
    return TextFormField(
      initialValue: "",
      onChanged: ((value) {}),
      validator: (_) {
        return null;
      },
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
}
