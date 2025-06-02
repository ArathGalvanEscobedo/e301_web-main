import 'package:e301_web/providers/auth_provider.dart';
import 'package:e301_web/ui/views/analytics_view.dart';
import 'package:e301_web/ui/views/categories_view.dart';
import 'package:e301_web/ui/views/costumers_view.dart';
import 'package:e301_web/ui/views/dashboard_view.dart';
import 'package:e301_web/ui/views/discounts_view.dart';
import 'package:e301_web/ui/views/icons_view.dart';
import 'package:e301_web/ui/views/login_view.dart';
import 'package:e301_web/ui/views/orders_view.dart';
import 'package:e301_web/ui/views/products_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      
      if (authProvider.authStatus == AuthStatus.authenticated) {
        return DashboardView();
      } else {
        return LoginView();
      }
    },
  );

  static Handler icons = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return IconsView();
      } else {
        return LoginView();
      }
    },
  );

  static Handler orders = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return OrdersView();
      } else {
        return LoginView();
      }
    },
  );

  static Handler analytics = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return AnalyticsView();
      } else {
        return LoginView();
      }
    },
  );

  

  static Handler categories= Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return CategoriesView();
      } else {
        return LoginView();
      }
    },
  );

  static Handler products= Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return ProductsView();
      } else {
        return LoginView();
      }
    },
  );

  static Handler discounts = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return DiscountsView();
      } else {
        return LoginView();
      }
    },
  );

  static Handler costumers = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return CustomersView();
      } else {
        return LoginView();
      }
    },
  );

  static Handler login = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return LoginView();
      } else {
        return LoginView();
      }
    },
  );






}
