import 'package:aloja/common/custon_drawer/custom_drawer_header.dart';
import 'package:aloja/common/drawer_tile.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          CustomDrawerHeader(),
        DrawerTile(
          iconData: Icons.home,
          title:'Inicio',
          page: 0,
        ),
          DrawerTile(
            iconData: Icons.list,
            title:'Produtos',
            page: 1,
          ),
          DrawerTile(iconData: Icons.playlist_add_check,
            title:'Meus Pedidos',
            page: 2,
          ),
          DrawerTile(iconData: Icons.location_on,
            title:'Lojas',
            page: 3,
          ),

        ]
      ),
    );
  }
}
