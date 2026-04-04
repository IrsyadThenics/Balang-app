import 'package:flutter/material.dart';
import 'login_page.dart'; // Import ke halaman login

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. Dekorasi Lingkaran Biru (Identik dengan Login)
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

          // 2. Konten Register
          SafeArea(
            child: SingleChildScrollView( // Menggunakan Scroll agar tidak error saat keyboard muncul
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 80), // Menyesuaikan posisi agar sejajar desain login
                    const Text(
                      'REGISTER',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0900FF),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Join us and start finding\nlost items",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 40),

                    // --- INPUT FIELDS (Ukuran & Style Sama dengan Login) ---
                    _buildInputField(
                      label: 'Full Name',
                      hintText: 'Nabil Azhra',
                      isPassword: false,
                    ),
                    const SizedBox(height: 20),

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
                    const SizedBox(height: 20),

                    _buildInputField(
                      label: 'Confirm Password',
                      hintText: '123Zhra',
                      isPassword: true,
                    ),

                    const SizedBox(height: 40),

                    // --- TOMBOL REGISTER ---
                    SizedBox(
                      width: double.infinity,
                      height: 55, // Tinggi sama dengan Login
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0900FF),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          // ALUR: Setelah register, balik ke Login
                          Navigator.pop(context); 
                        },
                        child: const Text(
                          'REGISTER',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // --- LINK KEMBALI KE LOGIN ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account? ',
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context); // Kembali ke Login
                          },
                          child: const Text(
                            'Login here',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget Input Field (Identik dengan Login)
  Widget _buildInputField({
    required String label,
    required String hintText,
    required bool isPassword,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
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
              hintStyle: const TextStyle(
                color: Colors.black87,
                fontSize: 15,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}