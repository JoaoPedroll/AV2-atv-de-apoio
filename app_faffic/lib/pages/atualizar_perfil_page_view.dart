import 'package:app_faffic/pages/perfil_page_view.dart';
import 'package:app_faffic/shared/tema.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AtualizarPerfilPage extends StatefulWidget {
  const AtualizarPerfilPage({super.key});

  @override
  State<AtualizarPerfilPage> createState() => _AtualizarPerfilPageState();
}

class _AtualizarPerfilPageState extends State<AtualizarPerfilPage> {

TextEditingController   _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
        bool dadosSalvos =false;
        var largura = MediaQuery.of(context).size.width;
    var altura = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
        title: Text("Atualizar Perfil"),
        backgroundColor: tema().corDeFundo,
        foregroundColor: Colors.white,
      ),

    body: Center(child: Column(children: [

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


    ],)
    ,),
         floatingActionButton: FloatingActionButton(
          onPressed: ()async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString(tema().email, _emailController.text);
              prefs.setString(tema().telefone, _telefoneController.text);  
              prefs.setString(tema().nome, _nomeController.text);
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PerfilPage())); 


          },
          child: Icon(Icons.save,color: Colors.white,),
          backgroundColor: tema().corDeFundo,
          shape: CircleBorder(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, 
    );
  }
}