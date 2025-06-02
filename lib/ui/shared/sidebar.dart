import 'package:e301_web/config/router/router.dart';
import 'package:e301_web/providers/auth_provider.dart';
import 'package:e301_web/providers/sidemenu_provider.dart';
import 'package:e301_web/services/navigation_service.dart';
import 'package:e301_web/ui/shared/widgets/logo.dart';
import 'package:e301_web/ui/shared/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  void navigateTo(String routeName) {
    NavigationService.navigateTo(routeName);
    SidemenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          //Logo
          Logo(),
          SizedBox(height: 50),

          //Opciones

          MenuItem(
            text: 'EMPRESA',
            icon: Icons.boy_outlined,
            onPressed: () => navigateTo(Flurorouter.dashboardRoute),
            isActive: false,
          ),
          MenuItem(
            text: 'PRODUCTOS',
            icon: Icons.shopping_cart_checkout_outlined,
            onPressed: () => navigateTo(Flurorouter.ordersRoute),
            isActive: false,
          ),
          MenuItem(
            text: 'PROMOCIONES',
            icon: Icons.category_outlined,
            onPressed: () => navigateTo(Flurorouter.analyticsRoute),
            isActive: false,
          ),
          MenuItem(
            text: 'SERVICIOS',
            icon: Icons.chrome_reader_mode_outlined,
            onPressed: () => navigateTo(Flurorouter.categoriesRoute),
            isActive: false,
          ),
          MenuItem(
            text: 'BLOG/CREATE',
            icon: Icons.star_border_outlined,
            onPressed: () => navigateTo(Flurorouter.productsRoute),
            isActive: false,
          ),
          MenuItem(
            text: 'PREGUNTAS',
            icon: Icons.chat_outlined,
            onPressed: () => navigateTo(Flurorouter.discountsRoute),
            isActive: false,
          ),
          MenuItem(
            text: 'UBICACION',
            icon: Icons.location_on_outlined,
            onPressed: () => navigateTo(Flurorouter.custumersRoute),
            isActive: false,
          ),
          
          MenuItem(
            text: 'CONTACTO',
            icon: Icons.contact_mail_outlined,
            onPressed: () => navigateTo(Flurorouter.iconsRoute),
          ),
         
          SizedBox(height: 30),
          MenuItem(
            text: 'Logout',
            icon: Icons.exit_to_app_outlined,
            onPressed: () async {
              await authProvider.logout();
              SidemenuProvider.closeMenu();
            },
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    gradient: LinearGradient(colors: [Color.fromARGB(255, 58, 127, 238), Color.fromARGB(255, 109, 166, 251)]),

  );
}
