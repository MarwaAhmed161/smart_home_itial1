import 'package:flutter/material.dart';
import 'RoomsPage.dart';
import 'register_page.dart';

class LoginScreeen extends StatefulWidget {
  const LoginScreeen({super.key});

  @override
  State<LoginScreeen> createState() => _LoginScreeenState();
}

class _LoginScreeenState extends State<LoginScreeen> {

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool loading = false;

  Future login() async {

    if(!_formKey.currentState!.validate()) return;

    setState(() => loading = true);

    //
    await Future.delayed(const Duration(seconds: 1));

    if(emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty){

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const RoomsPage()),
      );


    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid data")),
      );
    }

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              Image.asset("assets/images/the future house.jpg"),

              const SizedBox(height: 25),

              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                v!.isEmpty ? "Enter email" : null,
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Password",
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                v!.length < 4 ? "Password too short" : null,
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: loading ? null : login,
                  child: loading
                      ?  CircularProgressIndicator(color: Theme.of(context).cardColor
                  )
                      : const Text("Login"),
                ),
              ),

              const SizedBox(height: 15),

              TextButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RegisterScreen()),
                  );
                },
                child: const Text("Register Now"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
