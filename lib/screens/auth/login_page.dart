import 'package:flutter/material.dart';
// UBAH IMPORT INI: Arahkan ke file main.dart (tempat MainScreen berada)
// Jika MainScreen ada di main.dart, gunakan path relatif yang sesuai
import '../../main.dart'; 
import 'register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ... (Bagian dekorasi lingkaran tetap sama)
          Positioned(
            right: -50,
            top: -50,
            child: Container(
              width: 180,
              height: 180,
              decoration: const BoxDecoration(
                color: Color(0xFF0900FF),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            left: -80,
            bottom: -80,
            child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                color: Color(0xFF0900FF),
                shape: BoxShape.circle,
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ... (Bagian Text LOGIN dan Welcome tetap sama)
                  const Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0900FF),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Welcome back you've\nbeen missed",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 50),

                  _buildInputField(
                    label: 'Email',
                    hintText: 'nabilazhra@gmail.com',
                    isPassword: false,
                  ),
                  const SizedBox(height: 20),

                  _buildInputField(
                    label: 'Password',
                    hintText: '123Zhra',
                    isPassword: true,
                  ),

                  const SizedBox(height: 40),

                  // PERBAIKAN TOMBOL LOGIN
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0900FF),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        // UBAH INI: Arahkan ke MainScreen, bukan HomePage
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const MainScreen()),
                        );
                      },
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // REGISTER LINK (Sudah Benar)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('New here? '),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const RegisterPage()),
                          );
                        },
                        child: const Text(
                          'Register now',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ... (Widget _buildInputField tetap sama)
  Widget _buildInputField({
    required String label,
    required String hintText,
    required bool isPassword,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
          ),
        ),
      ],
    );
  }
}