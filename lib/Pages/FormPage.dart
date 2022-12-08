import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FormPage extends HookWidget {
  String title;
  FormPage(this.title, {Key? key}) : super(key: key);

  String? emailValidator(String? value) {
    return (value == null || value.isEmpty) ? 'This is a required field' : null;
  }

  String? passwordValidator(
      String? value,
      TextEditingController passwordController,
      TextEditingController repeatPasswordController,
      ) {
    if (value == null || value.isEmpty) return 'This is a required field';
    if (value.length < 6) return 'Password should be at least 6 letters';
    if (passwordController.text != repeatPasswordController.text) return 'Password do not match';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = useMemoized(() => GlobalKey<FormState>());
    final _emailController = useTextEditingController();
    final _passwordController = useTextEditingController();
    final _repeatPasswordController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: emailValidator,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) => passwordValidator(value, _passwordController, _repeatPasswordController),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _repeatPasswordController,
                decoration: const InputDecoration(labelText: 'Repeat Password'),
                validator: (value) => passwordValidator(value, _passwordController, _repeatPasswordController),
              ),
              Center(
                child: ElevatedButton(
                  child: const Text('Create'),
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      const snackBar = SnackBar(content: Text('Account created!!!'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}