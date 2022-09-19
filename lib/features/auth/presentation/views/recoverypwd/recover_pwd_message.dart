import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RecoverPwdMessagePage extends StatelessWidget {
  const RecoverPwdMessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.xmark),
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
            "Nous avons bien enregistré votre demande de réinitialisation de mot de passe. Si l’e-mail que vous nous avez communiqué est lié à un compte Good Food, un message vous a été envoyé à cette adresse.",
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff003049),
                minimumSize: const Size.fromHeight(80),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                textStyle: const TextStyle(color: Colors.white, fontSize: 30)),
            child: const Text("Continuer"),
          ),
          const Spacer(),
          Image.asset("assets/images/Good_food_logo1.png")
        ]),
      ),
    );
  }
}
