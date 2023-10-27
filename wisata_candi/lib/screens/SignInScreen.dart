import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _PasswordController = TextEditingController();

  String _errorText = '';
  bool _isSignedIn = false;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: "Nama Pengguna",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 28),
              TextFormField(
                controller: _PasswordController,
                decoration: InputDecoration(
                  labelText: "Kata Sandi",
                  errorText: _errorText.isNotEmpty ? _errorText : null,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _PasswordController,
                decoration: InputDecoration(
                  labelText: _errorText.isNotEmpty ? _errorText : null,
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
                obscureText: _obscurePassword,
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {}, child: Text('Sign In')),
              SizedBox(height: 18),
              TextButton(
                  onPressed: () {},
                  child: Text('Belum punya akun? Daftar di sini')),
            ],
          )),
        ),
      ),
    );
  }
}
