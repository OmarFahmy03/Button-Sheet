import 'package:flutter/material.dart';

class SignUpBottomSheet extends StatefulWidget {
  const SignUpBottomSheet({super.key});

  @override
  State<SignUpBottomSheet> createState() => _SignUpBottomSheetState();
}

class _SignUpBottomSheetState extends State<SignUpBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _userController = UserController();

    void _submit() {
    if (_formKey.currentState!.validate()) {
      final user = _userController.createUser(
          _confirmPasswordController.text, _passwordController.text);
      print("Login as ${user.username}");
      Navigator.pop(context);
    } else {
      print("Login Failed");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
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
                        "Hello!",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Register",
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
                controller: TextEditingController(),
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.person),
                    labelText: "Username",
                    hintText: "Username", border: OutlineInputBorder()),
                validator: (value)
                {
                  if (value!.isEmpty) {
                    return "Please enter your username";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: TextEditingController(),
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.book),
                  labelText: "Course",
                    hintText: "Course", border: OutlineInputBorder()),
                  validator: (value)
                  {
                    if (value!.isEmpty) {
                      return "Please enter your course";
                    }
                    return null;
                  }
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.lock),
                          labelText: "Password",
                          hintText: "Password",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty || value.length < 8) {
                            return "Password must be at least 8 characters";
                          }
                          return null;
                        },
                        obscureText: true, // Hide password
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _confirmPasswordController,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.lock),
                          labelText: "Confirm Password",
                          hintText: "Confirm Password",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Confirm Password is required";
                          } else if (value != _passwordController.text) {
                            return "Passwords do not match";
                          }
                          return null;
                        },
                        obscureText: true, // Hide password
                      ),
                    const SizedBox(
                        height: 10,
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
              ),
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