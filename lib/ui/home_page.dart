import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _search; //variaveal que recebe string da pesquisa
  int _offset = 0; //variavel que configura o offset da url pesquisada

  Future<Map> _getGifs() async{
    http.Response response;
    //testa se esta sendo pesquisado alguma coisa
    if(_search == null){
      //retorna os melhores gifs
      response = await http.get('https://api.giphy.com/v1/gifs/trending?api_key=uE76B1lk8nl0k3IGazh8IgnDbaPH8YrI&limit=20&rating=g');
    }
    else{
      //retorna os gifs feito na pesquisa
      response = await http.get('https://api.giphy.com/v1/gifs/search?api_key=uE76B1lk8nl0k3IGazh8IgnDbaPH8YrI&q=$_search&limit=20&offset=$_offset&rating=g&lang=pt');
    }
    
    return json.decode(response.body);

  }


  @override
  void initState(){
    super.initState();
    
    _getGifs().then((Map){
      print(Map);

    });
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
