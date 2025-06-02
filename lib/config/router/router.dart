import 'package:e301_web/config/handlers/admin_handlers.dart';
import 'package:e301_web/config/handlers/dashboard_handlers.dart';
import 'package:e301_web/config/handlers/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  //auth router
  static String loginRoute = 'auth/login';
  static String registerRoute = 'auth/register';

  //dashboard router
  static String dashboardRoute = '/dashboard';
  static String iconsRoute = '/dashboard/icons';
  
  //orders router
  static String ordersRoute = '/dashboard/orders';

  //analytics router
  static String analyticsRoute = '/dashboard/analytics';

  //categories router
  static String categoriesRoute = '/dashboard/categories';

  //products router
  static String productsRoute = '/dashboard/products';

  //discounts router
  static String discountsRoute = '/dashboard/discounts';

  //costumers router
  static String custumersRoute = '/dashboard/custumers';

  static void configureRouters() {


    
    router.define(
      rootRoute,
      handler: AdminHandlers.login,
      transitionType: TransitionType.none,
    );
    router.define(
      loginRoute,
      handler: AdminHandlers.login,
      transitionType: TransitionType.none,
    );
    router.define(
      registerRoute,
      handler: AdminHandlers.register,
      transitionType: TransitionType.none,
    );

    //Dashboard
    router.define(
      dashboardRoute,
      handler: DashboardHandlers.dashboard,
      transitionType: TransitionType.none,
    );
    router.define(
      iconsRoute,
      handler: DashboardHandlers.icons,
      transitionType: TransitionType.none,
    );

    //Orders
    router.define(
      ordersRoute,
      handler: DashboardHandlers.orders,
      transitionType: TransitionType.none,
    );

    //analytics
    router.define(
      analyticsRoute,
      handler: DashboardHandlers.analytics,
      transitionType: TransitionType.none,
    );

    //categories
    router.define(
      categoriesRoute,
      handler: DashboardHandlers.categories,
      transitionType: TransitionType.none,
    );

    //products
    router.define(
      productsRoute,
      handler: DashboardHandlers.products,
      transitionType: TransitionType.none,
    );

    //discounts
    router.define(
      discountsRoute,
      handler: DashboardHandlers.discounts,
      transitionType: TransitionType.none,
    );

    //costumers
    router.define(
      custumersRoute,
      handler: DashboardHandlers.costumers,
      transitionType: TransitionType.none,
    );
    
    //404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
