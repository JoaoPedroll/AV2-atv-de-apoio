import 'package:app_faffic/pages/create_account_view.dart';
import 'package:app_faffic/pages/perfil_page_view.dart';
import 'package:app_faffic/shared/tema.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoguinPage extends StatefulWidget {
  const LoguinPage({Key? key}) : super(key: key);

  @override
  State<LoguinPage> createState() => _LoguinPageState();
}

class _LoguinPageState extends State<LoguinPage> {

  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  
  

  @override
  Widget build(BuildContext context) {

    var largura = MediaQuery.of(context).size.width;

    return SafeArea(child:
    Scaffold(
      backgroundColor: Colors.white,
      body: Center(child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //campo imagem
            Image.asset(tema().logoOrizontal, width: largura-16 ,height: 102),
            
            SizedBox(height: 48),

            //campo email
            SizedBox(
              width: largura-16,
              height: 48,
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                prefixIcon: Icon(Icons.alternate_email),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  label: Text("E-mail"),
                  hintText: "Digite seu e-mail"
                ),
              ),
            ),

            SizedBox(height: 24),

            //campo senha
            SizedBox(
              width: largura-16,
              height: 48,
              child: TextField(
                obscureText: true,
                controller: _senhaController,
                decoration: InputDecoration( 
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: Icon(Icons.visibility),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  label: Text("Senha"),
                  hintText: "Digite sua senha"
                ),
              ),
            ),

            SizedBox(height: 24),

            //botões
            ElevatedButton(onPressed: ()async{ 
              try {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              String email = prefs.getString('email')!;
              String senha = prefs.getString('senha')!;

                bool emailCorreto =_emailController.text==email;
                bool senhaCorreta = _senhaController.text==senha;
                if( senhaCorreta && emailCorreto ){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PerfilPage())); 
                }
              } on Exception catch (e) {
                //
              }
                            
               },
             child: Text("Entrar", style: TextStyle(fontSize: 16,color: Colors.white),),
             style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
              fixedSize: MaterialStateProperty.all(Size(largura-16,48)),
              backgroundColor: MaterialStateProperty.all(tema().corDeFundo),
             ), 
             ),



              Padding(padding: EdgeInsets.symmetric(vertical:16),
              child: Text("ou"),),


                   ElevatedButton(onPressed: (){ 
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAccountPage()));  },
             child: Text("Criar Conta", style: TextStyle(fontSize: 16,color: Colors.white),),
             style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
              fixedSize: MaterialStateProperty.all(Size(largura-16,48)),
              backgroundColor: MaterialStateProperty.all(tema().corDeFundo),
             ), 
             ),



          ],
        )),
    )
    );
  }
}