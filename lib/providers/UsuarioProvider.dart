import 'dart:core' as prefix0;
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:app_votos/models/UsuarioModel.dart';
import 'package:app_votos/models/ExistModel.dart';

class UsuarioProvider {

  String _url = '192.168.137.125';
  
  Future<Usuario> getUsuario(String usuarioId) async {
    final url = Uri.http(_url, 'Elecciones/api/usuario/$usuarioId');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final usuarioAux = usuarioFromJson(response.body);
      return usuarioAux;
    } else {
      Usuario usError = new Usuario(
        ci: "error"
      );
      return usError;
    }
  }

    Future<Usuario>verificarUsuario(String ci, String fecha) async {
    final url = Uri.http(_url, 'Elecciones/api/usuarios/$ci/$fecha');
    final response = await http.get(url);
    if(response.statusCode == 200) {
      final respuesta = usuarioFromJson(response.body);
      return respuesta;
    } else {
      Usuario usr = new Usuario(
        ci: 'error'
      );
      return usr;
    }
  }
}