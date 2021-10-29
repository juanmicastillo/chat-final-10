import 'package:http/http.dart' as http;

import 'package:chat/models/usuario.dart';
import 'package:chat/global/environment.dart';
import 'package:chat/models/usuarios_response.dart';

import 'package:chat/services/auth_service.dart';

class UsuariosService {
  Future<List<Usuario>> getUsuarios() async {
    final uri = Uri.parse('${Environment.apiUrl}/usuarios');
    String? token = await AuthService.getToken();

    try {
      final resp = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'x-Token': token.toString()
      });

      final usuarioResponse = usuariosResponseFromJson(resp.body);
      return usuarioResponse.usuarios;
    } catch (e) {
      return [];
    }
  }
}
  











// Future<List<Usuario>> getUsuario() async {
//     //obteniendo el token
//     String? token = await AuthService.getToken();
//     try {
//       final resp = await http.get(Uri.parse('${Enviroment.apiUrl}/usuarios'),
//           headers: {
//             'Content-Type': 'application/json',
//             'x-Token': token.toString()
//           });

//       final usuarioResponse = loginResponseFromJson(resp.body);
//       return usuarioResponse.usuarios;
//     } catch (e) {
//       return [];
//     }
//   }