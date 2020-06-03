import 'package:flutter/material.dart';
import 'package:shareskill/screens/auth_screens/name_input_screen.dart';
import 'package:shareskill/screens/category_screen.dart';

enum AuthState { Signup, Login }

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.indigo,
                  Colors.amberAccent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 1],
              ),
            ),
          ),
          Container(
            child: Center(child: AuthenticationCard()),
          ),
        ],
      ),
    );
  }
}

class AuthenticationCard extends StatefulWidget {
  // final Function sendingAuthDetails;
  // AuthenticationCard({this.sendingAuthDetails});

  @override
  _AuthenticationCardState createState() => _AuthenticationCardState();
}

class _AuthenticationCardState extends State<AuthenticationCard> {
  var _isLoading = false;
  final _passwordController = TextEditingController();
  AuthState _authState = AuthState.Login;
  final GlobalKey<FormState> _loginFormKey = GlobalKey();
  Map<String, String> _authDetails = {
    'email': '',
    'password': '',
  };

  void _switchAuthStatus() {
    if (_authState == AuthState.Login) {
      setState(() {
        _authState = AuthState.Signup;
      });
    } else {
      setState(() {
        _authState = AuthState.Login;
      });
    }
  }

  void _signUp() {
    if (!_loginFormKey.currentState.validate()) {
      return;
    }
    _loginFormKey.currentState.save();
    Navigator.of(context)
        .pushNamed(NameInputScreen.routeName, arguments: _authDetails);
  }

  void _login() {
    if (!_loginFormKey.currentState.validate()) {
      return;
    }
    print('This is printed in the auth Screen');
    print(_authDetails);
    Navigator.of(context).pushNamed(CategoryListScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 20,
        child: Container(
          height: _authState == AuthState.Signup ? 380 : 320,
          width: 300,
          padding: EdgeInsets.all(20),
          child: Form(
            key: _loginFormKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty || !value.contains('@')) {
                      return 'Invalid email';
                    }
                  },
                  onSaved: (value) {
                    _authDetails['email'] = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value.isEmpty || value.length < 8) {
                      return 'Invalid Password';
                    }
                  },
                ),
                if (_authState == AuthState.Signup)
                  TextFormField(
                    enabled: _authState == AuthState.Signup,
                    decoration: InputDecoration(labelText: 'Confirm Password'),
                    obscureText: true,
                    // onFieldSubmitted: ,
                    validator: _authState == AuthState.Signup
                        ? (value) {
                            if (value != _passwordController.text) {
                              return 'Password Mismatch';
                            }
                          }
                        : null,
                  ),
                SizedBox(
                  height: 20,
                ),
                if (_isLoading)
                  CircularProgressIndicator()
                else
                  RaisedButton(
                    onPressed: () {
                      _authState == AuthState.Signup ? _signUp() : _login();
                    },
                    child: Text(
                        _authState == AuthState.Signup ? 'SignUp' : 'Login'),
                    color: Theme.of(context).primaryColor,
                  ),
                FlatButton(
                  onPressed: _switchAuthStatus,
                  child: Text(_authState == AuthState.Signup
                      ? 'Login Instead'
                      : 'SignUp'),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  textColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
