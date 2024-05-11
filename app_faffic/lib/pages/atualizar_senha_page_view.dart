import 'package:app_faffic/pages/perfil_page_view.dart';
import 'package:app_faffic/shared/tema.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AtualizarSenhaPage extends StatefulWidget {
  const AtualizarSenhaPage({super.key});

  @override
  State<AtualizarSenhaPage> createState() => _AtualizarSenhaPageState();
}

class _AtualizarSenhaPageState extends State<AtualizarSenhaPage> {
    TextEditingController _senhaControllerAqui = TextEditingController();
        TextEditingController _novasenhaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
        var largura = MediaQuery.of(context).size.width;
    var altura = MediaQuery.of(context).size.height;
    return Scaffold(
      
        appBar: AppBar(
        title: Text("Atualizar Senha"),
        backgroundColor: tema().corDeFundo,
        foregroundColor: Colors.white,
      ),
      
      body: Center(child: Column(children: [

             SizedBox(height: 24),

            //campo senha
            SizedBox(
              width: largura-16,
              height: 48,
              child: TextField(
                obscureText: true,
                controller: _senhaControllerAqui,
                decoration: InputDecoration( 
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: Icon(Icons.visibility),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  label: Text("Senha atual"),
                  hintText: "Digite sua senha atual"
                ),
              ),
            ),


             SizedBox(height: 24),

            //campo senha nova
            SizedBox(
              width: largura-16,
              height: 48,
              child: TextField(
                obscureText: true,
                controller: _novasenhaController,
                decoration: InputDecoration( 
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: Icon(Icons.visibility),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  label: Text("Nova Senha"),
                  hintText: "Digite sua nova senha"
                ),
              ),
            ),

        SizedBox(height: 24),

            //botões
            ElevatedButton(onPressed: ()async{ 
              try {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              print(prefs.getString(tema().senha));
              print(_senhaControllerAqui);

              if(prefs.getString(tema().senha) ==_senhaControllerAqui.text){
                prefs.setString(tema().senha, _novasenhaController.text);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PerfilPage()));
              } 
           
              

              } on Exception catch (e) {
                //
              }
                            
               },
             child: Text("Salvar Nova Senha", style: TextStyle(fontSize: 16,color: Colors.white),),
             style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
              fixedSize: MaterialStateProperty.all(Size(largura-16,48)),
              backgroundColor: MaterialStateProperty.all(tema().corDeFundo),
             ), 
             ),




      ],),),
      


    );
  }
}