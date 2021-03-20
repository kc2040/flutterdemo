import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo App',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super (key:key);

  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  bool isLoginSuccess = true;

  bool authenticate() {
    setState(() {
      //_count = int.parse(num1Controller.text) + int.parse(num2Controller.text); //getSum(56, 67);
      isLoginSuccess = loginUser(usernameController.text , passwordController.text) ;
    });
    return isLoginSuccess;
  }

  bool loginUser(var usrname, var pwd) {
    if (usrname == 'demo' &&  pwd == 'demo')
      return true;
    return false;
  }

  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Flutter DEMO App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.0,),
              Text(
                'Log in info',
                style: TextStyle( fontFamily: 'Arial',
                  color: Colors.grey,
                  fontSize: 18.0,
                ),

              ),
              SizedBox(height: 25.0,),
              Flexible(
                child: new Image.asset('assets/login.png', width: 100.0, height: 100.0,),
              ),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[

                        SizedBox(height: 30),
                        TextFormField(
                          key: Key('_username'),
                          decoration: InputDecoration(hintText: "user name", border: OutlineInputBorder()),
                          controller: usernameController,
                          validator: (value) => value.isEmpty ? 'Input at least one character' : null,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          key: Key('_password'),
                          controller: passwordController,
                          decoration: InputDecoration(hintText: "password", border: OutlineInputBorder()),
                          validator: (value) => value.isEmpty? 'Input at least one character': null,
                          obscureText: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            (isLoginSuccess) ?'' : 'Login failed.',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                if (authenticate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailPage()),
                                  );
                                }
                              },

                              child: Text(
                                'Log in',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              )),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }
}

class DetailPage extends StatefulWidget {

  const DetailPage({
    Key key,
  }): super (key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Flutter DEMO App'),
        ),
        body: Center(
          child: Text(
            'Log in success.',
            style: TextStyle( fontFamily: 'Arial',
                color: Colors.cyan,
                fontSize: 40.0,
                fontWeight: FontWeight.bold),

          ),
        ));
  }
}
