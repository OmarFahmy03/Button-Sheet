import 'package:flutter/material.dart';

class LoginBottomSheet extends StatefulWidget {
  const LoginBottomSheet({super.key});

  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  bool _rememberMe = false;
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _userController = UserController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final user = _userController.createUser(
          _usernameController.text, _passwordController.text);
      print("Login as ${user.username}");
      Navigator.pop(context);
    } else {
      print("Login Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Aligns the text to the left
                    children: [
                      const Text(
                        "Welcome Back!",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Login",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 38, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: const Icon(Icons.close))
                ],
              ),

              TextFormField(
                decoration: const InputDecoration(
                    labelText: "Username",
                    hintText: "Username",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.person)),
                controller: _usernameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Username is required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                labelText: "Password",
                hintText: "Password", border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.lock)),
                controller: _passwordController,
                obscureText: true,

                validator: (value)
                {
                  if(value == null || value.length < 8)
                  {
                    return "Password must be at least 8 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
              children: [
                Expanded(
                  child: CheckboxListTile(
                    title: const Text("Remember me"),
                    value: _rememberMe,
                    onChanged: (bool? value) {
                      setState(() {
                        _rememberMe = value!; // Update the state
                      });
                      print(value);
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Forgot password action
                  },
                  child: const Text("Forgot Password?"),
                ),
              ],
            ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff050522),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                ),
                onPressed: _submit,
                child: const Text("Login"),
              )
            ],
          )),
    );
  }
}
class UserController {
  User createUser(String username, String password) {
    return User(username: username, password: password);
  }
}

class User {
  String username;
  String password;

  User({required this.username, required this.password});
}
