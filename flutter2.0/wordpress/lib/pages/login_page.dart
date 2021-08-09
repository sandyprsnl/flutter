import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../services/progressHUD.dart';
import '../utils/form_helper.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  static const routName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String _username = "";
  String _pwd = '';
  bool hidePassword = true;
  bool isApiCallProcess = false;

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.height);
    // print(MediaQuery.of(context).size.height / 3.5);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[200],
      key: _scaffoldKey,
      body: ProgressHud(
        child: _loginUISetup(context),
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
      ),
    ));
  }

  Widget _loginUISetup(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Form(
          key: globalFormKey,
          child: loginUI(context),
        ),
      ),
    );
  }

  Widget loginUI(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3.5,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.redAccent, Colors.redAccent]),
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(150))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: Image.network(
                  'https://impress.org/wp-content/uploads/wordpress.png',
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20, top: 40),
            child: Text(
              'Login',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20, top: 20),
          child: FormHelper.inputFieldWidget(
            context,
            Icon(Icons.verified_user),
            'username',
            'Username',
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "Username can\'t be Empty";
              }
              return null;
            },
            (onSavedVal) {
              _username = onSavedVal.toString().trim();
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: 20,
          ),
          child: FormHelper.inputFieldWidget(
            context,
            Icon(Icons.lock),
            'password',
            'Password',
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "Password can\'t be Empty";
              }
              return null;
            },
            (onSavedVal) {
              _pwd = onSavedVal.toString().trim();
            },
            initialValue: '',
            obscureText: hidePassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              icon:
                  Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
              color: Colors.redAccent.withOpacity(0.4),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: FormHelper.saveButton('Login', () {
            if (validateAndSave()) {
              print('Username : $_username password $_pwd');
              setState(() {
                this.isApiCallProcess = true;
              });
              APIServices.loginCustomer(_username, _pwd).then((response) {
                setState(() {
                  this.isApiCallProcess = false;
                });
                if (response) {
                  print('get');
                  globalFormKey.currentState!.reset();
                  Navigator.of(context).pushNamed(HomePage.routName);
                } else {
                  FormHelper.showMessage(context, 'Wordpress Login',
                      'Invalid Username or Password', 'Ok', () {
                    Navigator.of(context).pop();
                  });
                }
                print(response);
              });
            }
          }),
        ),
      ],
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
