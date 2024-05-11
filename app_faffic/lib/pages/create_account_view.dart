
import 'dart:io';

import 'package:app_faffic/pages/perfil_page_view.dart';
import 'package:app_faffic/shared/tema.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {


TextEditingController   _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var largura = MediaQuery.of(context).size.width;

    return SafeArea(child:
    Scaffold(
      appBar: AppBar(
        title: Text("Criar Conta"),
        centerTitle: true,
        backgroundColor: tema().corDeFundo,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //imagem
            Image.asset(tema().logoOrizontal, width: largura-16 ,height: 102),

            SizedBox(height: 48),



            //campo nome
            SizedBox(
              width: largura-16,
              height: 48,
              child: TextField(
                
                controller: _nomeController,
                decoration: InputDecoration( 
                  prefixIcon: Icon(Icons.abc),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  label: Text("Nome"),
                  hintText: "Digite seu nome"
                ),
              ),
            ),

             SizedBox(height: 24),



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


            //campo telefone
            SizedBox(
              width: largura-16,
              height: 48,
              child: TextField(
                obscureText: true,
                controller: _telefoneController,
                decoration: InputDecoration( 
                  prefixIcon: Icon(Icons.call),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  label: Text("Telefone"),
                  hintText: "Digite seu Telefone"
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
              prefs.setString(tema().email, _emailController.text);
              prefs.setString(tema().senha, _senhaController.text); 
              prefs.setString(tema().nome, _nomeController.text);
              prefs.setString(tema().telefone, _telefoneController.text);           
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PerfilPage()));

              } on Exception catch (e) {
                //
              }
                            
               },
             child: Text("Criar Conta e Entrar", style: TextStyle(fontSize: 16,color: Colors.white),),
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