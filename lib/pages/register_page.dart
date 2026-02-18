import 'package:flutter/material.dart';
import 'login_page.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  bool loading = false;

  Future register() async {

    if(!_formKey.currentState!.validate()) return;

    setState(() => loading = true);

    // محاكاة API مؤقتاً
    await Future.delayed(const Duration(seconds: 1));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreeen()),
    );

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              Image.asset("assets/images/energy.jpg", height: 220),

              const SizedBox(height: 20),

              TextFormField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  hintText: "First Name",
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                v!.isEmpty ? "Enter first name" : null,
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  hintText: "Last Name",
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                v!.isEmpty ? "Enter last name" : null,
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                v!.isEmpty ? "Enter email" : null,
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                v!.length < 4 ? "Password too short" : null,
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: confirmController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Confirm Password",
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                v != passwordController.text
                    ? "Passwords not match"
                    : null,
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: loading ? null : register,
                  child: loading
                      ?  CircularProgressIndicator(color: Theme.of(context).cardColor
                  )
                      : const Text("Register"),
                ),
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  TextButton(
                    onPressed: (){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreeen()),
                      );
                    },
                    child: const Text("Login"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
