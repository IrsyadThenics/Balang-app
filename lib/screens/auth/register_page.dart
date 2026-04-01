import 'package:flutter/material.dart';
// PASTIKAN PATH IMPORT DI BAWAH INI BENAR SESUAI PROJECT ANDA
// Contoh: import '../../home/home_page.dart'; 
import '../home/home_page.dart'; 

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Lingkaran biru kanan atas
          Positioned(
            right: -60,
            top: -50,
            child: Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                color: Color(0xFF0900FF),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Lingkaran biru kiri bawah
          Positioned(
            left: -80,
            bottom: -80,
            child: Container(
              width: 220,
              height: 220,
              decoration: const BoxDecoration(
                color: Color(0xFF0900FF),
                shape: BoxShape.circle,
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 120),
                  const Text(
                    'REGISTER',
                    style: TextStyle(
                      fontSize: 36,
                      // PERBAIKAN: Gunakan w900 sebagai pengganti black
                      fontWeight: FontWeight.w900, 
                      color: Color(0xFF0900FF),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Join us and start finding\nlost items",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF454545),
                    ),
                  ),
                  const SizedBox(height: 60),

                  _buildInputField(hintText: 'Email', isPassword: false),
                  const SizedBox(height: 20),
                  _buildInputField(hintText: 'Password', isPassword: true),
                  const SizedBox(height: 20),
                  _buildInputField(hintText: 'Confirm Password', isPassword: true),

                  const SizedBox(height: 40),

                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2B2BFF),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        // Navigasi ke HomePage
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
                      },
                      child: const Text(
                        'REGISTER',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required String hintText,
    required bool isPassword,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        obscureText: isPassword,
        style: const TextStyle(fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
        ),
      ),
    );
  }
}