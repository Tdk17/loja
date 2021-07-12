import 'package:aloja/common/custon_drawer/custon_drawer.dart';
import 'package:aloja/models/page_maneger.dart';
import 'package:aloja/screens/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {

  final PageController pageController = PageController();


  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: PageView(
        controller: pageController,
        physics:  const NeverScrollableScrollPhysics(),
        children: <Widget>[

        Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            title: const Text("Home"),
          ),
        ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text("Produtos"),
            ),
          ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text("Meus Pedidos"),
            ),
          ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text("Lojas"),
            ),
          ),
        ],
      ),
    );
  }
}

