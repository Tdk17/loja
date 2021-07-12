import 'package:aloja/helpers/validators.dart';
import 'package:aloja/models/user.dart';
import 'package:aloja/models/user_maneger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey <ScaffoldState> scaffoldKay = GlobalKey<ScaffoldState>();


  final User user = User();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKay,
      appBar: AppBar(
        title: const Text('Criar conta'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16 ),
          child: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              children: <Widget>[

                TextFormField(
         decoration: const InputDecoration(hintText: 'Nome Completo'),
                  validator: (name){
             if(name.isEmpty)
               return 'Campo Obrigatorio';
             else if(name.trim().split(' ').length <= 1)
               return 'Preencha seu Nome Completo';
             return null;
                  },
                  onSaved: (name) => user.name = name,
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email.isEmpty)
                      return 'Campo Obrigatorio';
                    else if (!emailValid(email))
                      return 'Email invalido';
                    return null;
                  },
                  onSaved: (email) => user.email = email,
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Senha'),
                  obscureText: true,
                  validator: (pass){
                    if(pass.isEmpty);
                    else if (pass.length < 6)
                      return 'Senha muito curta';
                    return null;
                  },
                  onSaved: (pass) => user.password = pass,
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Repita a Senha'),
                  obscureText: true,
                        validator: (pass){
                        if(pass.isEmpty);
                        else if (pass.length < 6)
                        return 'Senha muito curta';
                        return null;
                  },
                    onSaved: (pass) => user.confirmPassword = pass,
                ),
                const SizedBox(height: 16,),
                SizedBox(
                  height: 44,
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    disabledColor: Theme.of(context).primaryColor .withAlpha(100),
                    textColor: Colors.white,
                    onPressed: (){
                      if(formKey.currentState.validate()) {
                        formKey.currentState.save();

                        if (user.password != user.confirmPassword) {
                          scaffoldKay.currentState.showSnackBar(
                              SnackBar(
                                content: const Text('Senhas nao sao iguais!'),
                                backgroundColor: Colors.red,
                              )
                          );
                          return;
                        }
                        context.read<UserManager>().signUp(
                          user: user,
                          onSucess: (){
                            debugPrint('Seucesso');
                              //TODO: POP
                          },
                          onfail: (e){
                            SnackBar(
                              content: Text('Falha ao Cadastrar: $e'),
                              backgroundColor: Colors.red,
                            );
                          }
                        );
                      }
                    },

                    child: const Text(
                      'Criar Conta',
                      style: TextStyle(
                          fontSize: 18
                      ),
                    ),

                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
