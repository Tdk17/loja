import 'package:aloja/helpers/validators.dart';
import 'package:aloja/models/user.dart';
import 'package:aloja/models/user_maneger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {



  final TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey <ScaffoldState> scaffoldKay = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKay,
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              Navigator.of(context).pushReplacementNamed('/signup');
            },
            textColor: Colors.white,
            child: const Text('Criar Conta',
            style: TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric( horizontal: 16),
          child: Form(
            key: formKey,
            child:Consumer<UserManager>(
              builder: (_,userManager,__){
               return ListView(
                  padding:  const EdgeInsets.all(16),
                  shrinkWrap: true,
                  children: <Widget>[
                    TextFormField(
                      controller: emailController,
                      enabled: !userManager.loading,
                      decoration: const InputDecoration(hintText: 'E-mail'),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      validator: (email){
                        if(!emailValid(email))
                          return 'E-mail invalido';
                        return null;
                      },
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(
                      controller: passController,
                      enabled: !userManager.loading,
                      decoration: const InputDecoration(hintText: 'Senha'),
                      autocorrect: false,
                      obscureText: true,
                      validator: (pass){
                        if(pass.isEmpty || pass.length < 6)
                          return 'Senha invalida';
                        return null;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: (){

                        },
                        padding: EdgeInsets.zero,
                        textColor: Colors.black,
                        child: const Text('Esqueci minha senha'),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    SizedBox(
                      height: 44,
                      child: RaisedButton(
                        onPressed: userManager.loading ? null : (){
                          formKey.currentState.validate();
                          userManager.signIn(
                              user: User(
                                email: emailController.text,
                                password: passController.text,
                              ),
                              onFail: (e){
                                scaffoldKay.currentState.showSnackBar(
                                    SnackBar(
                                      content: Text('Falha ao entrar: $e'),
                                      backgroundColor: Colors.red,
                                    )
                                );
                              },
                              onSuccess: (){
                                //TODO: FECHAR TELA DE LOGIN
                              }
                          );


                        },
                        color: Theme.of(context).primaryColor,
                        disabledColor: Theme.of(context).primaryColor.withAlpha(100),
                        textColor: Colors.white,
                        child: userManager.loading ?
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ) :
                        const Text(
                          'Entrar',
                          style: TextStyle(
                              fontSize: 18
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ) ,
          ),
        ),
      ),
    );
  }
}
