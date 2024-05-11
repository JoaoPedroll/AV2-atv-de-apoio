import 'package:app_faffic/pages/atualizar_perfil_page_view.dart';
import 'package:app_faffic/pages/atualizar_senha_page_view.dart';
import 'package:app_faffic/shared/tema.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {

  

  Future<String> atualizarTitulo() async {
 
    SharedPreferences prefs = await SharedPreferences.getInstance();
   
      String titulo = prefs.getString(tema().nome)!;
      return titulo;
    
  }

  Future<String> carregarDados(String dado) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(dado=="nome"){
    String data = prefs.getString(tema().nome)!;
    return data;
    }else if(dado=="email"){
    String data = prefs.getString(tema().email)!;
    return data;
    }else if(dado=="telefone"){
    String data = prefs.getString(tema().telefone)!;
    return data;
    }else return "erro";
  }

  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width;
    var altura = MediaQuery.of(context).size.height;
    return SafeArea(child: Scaffold(
      
      
      appBar: AppBar ( 
        title:  FutureBuilder<String>(
          future: atualizarTitulo(),
          builder: ((context, snapshot){
            return Text('Olá ${snapshot.data}.');
          }),
        ) ,
        centerTitle: true,
        backgroundColor: tema().corDeFundo,
        foregroundColor: Colors.white,
      ),

    body: Center(child: Column(children: [
SizedBox(height: 24,),

//foto

SizedBox(height: 24,),

    Container(width: largura-16,height: 44,
      child: ElevatedButton.icon(
        onPressed: (){},
  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey),
  alignment: Alignment.centerLeft,
  elevation: MaterialStateProperty.all(0)),
  label: FutureBuilder<String>(
        future: carregarDados(tema().nome),
        builder: (context, snapshot){
          return Text("${snapshot.data}",style: TextStyle(color: Colors.black87),);},),
  icon: Icon(Icons.abc,color:tema().corDeFundo,),),
),

SizedBox(height: 24,),

    Container(width: largura-16,height: 44,
      child: ElevatedButton.icon(
        onPressed: (){},
  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey),
  alignment: Alignment.centerLeft,
  elevation: MaterialStateProperty.all(0)),
  label: FutureBuilder<String>(
        future: carregarDados(tema().telefone),
        builder: (context, snapshot){
          return Text("${snapshot.data}",style: TextStyle(color: Colors.black87),);},),
  icon: Icon(Icons.call,color:tema().corDeFundo,),),
),

SizedBox(height: 24,),

    Container(width: largura-16,height: 44,
      child: ElevatedButton.icon(
        onPressed: (){},
  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey),
  alignment: Alignment.centerLeft,
  elevation: MaterialStateProperty.all(0)),
  label: FutureBuilder<String>(
        future: carregarDados(tema().email),
        builder: (context, snapshot){
          return Text("${snapshot.data}",style: TextStyle(color: Colors.black87),);},),
  icon: Icon(Icons.alternate_email,color:tema().corDeFundo,),),
),
      
SizedBox(height: 24,),

    ElevatedButton(onPressed: (){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AtualizarSenhaPage()));
    },
      child: Text("Mudar Senha", style: TextStyle(fontSize: 16,color: Colors.white),),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                  fixedSize: MaterialStateProperty.all(Size(largura-16,48)),
                  backgroundColor: MaterialStateProperty.all(tema().corDeFundo),
                ), ),

    



    ],
    ),
    ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AtualizarPerfilPage()));
          },
          child: Icon(Icons.edit,color: Colors.white,),
          backgroundColor: tema().corDeFundo,
          shape: CircleBorder(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, 
      
    ));
    
    
  }
}