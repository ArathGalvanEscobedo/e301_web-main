import 'package:e301_web/config/router/router.dart';
import 'package:e301_web/services/local_storage.dart';
import 'package:e301_web/services/navigation_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    //TODO:implementar petición HTTP
    _token = 'agshjgjq.jhshjdashjasd.iukj';
    //print('Almacenar JWT: $_token');
    LocalStorage.prefs.setString('token', _token!);

    //TODO: navegar al dashboard
    authStatus = AuthStatus.authenticated;
    notifyListeners();
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    //TODO:Ir al backend y comprobar que el JWT es válido

    await Future.delayed(Duration(milliseconds: 1000));
    authStatus = AuthStatus.authenticated;
    notifyListeners();

    NavigationService.replaceTo(Flurorouter.dashboardRoute);

    return true;
  }
  Future<void> logout() async {
    _token = null;
    await LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();

    // Navegar a login
    NavigationService.replaceTo(Flurorouter.loginRoute);
  }
}
