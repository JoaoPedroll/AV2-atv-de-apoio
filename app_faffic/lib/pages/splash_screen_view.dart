import 'package:app_faffic/pages/loguin_view.dart';
import 'package:app_faffic/shared/tema.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  @override
  void initState() {
    super.initState(); 

    Future.delayed(
      Duration(seconds: 2),
      (){
        Navigator.pushReplacement(context, MaterialPageRoute
        (builder: (context)=>LoguinPage()));
      }
      
    );
    
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: tema().corDeFundo,
        body: Center(child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //imagem
            Image.asset(tema().logoSimples, width: 105,height: 102),
            //texto
            const Text(" Saudações, agradecemos por\n        usar nosso aplicativo.", style: TextStyle(color: Colors.white,
            fontSize: 20)),
            //versao
            const Text("Versão 0.0.1.pre-alpha", style: TextStyle(color: Colors.white,
            fontSize: 20)),
          ],
        ),)
      ),
    );
  }
}