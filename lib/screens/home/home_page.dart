import 'package:flutter/material.dart';
import 'notification_page.dart'; 
import 'detail_page.dart'; // 1. PASTIKAN SUDAH DIIMPORT

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. KONTEN UTAMA
          Column(
            children: [
              // Header Biru
              Container(
                width: double.infinity,
                height: 280,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: const BoxDecoration(
                  color: Color(0xFF0900FF),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                child: Text('👩', style: TextStyle(fontSize: 24)),
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'Halo, nabilazhra',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(Icons.notifications, color: Colors.white, size: 30),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const NotificationPage()),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        'Menemukan\nsesuatu?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Daftar Item Barang
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
                  children: [
                    _buildItemCard(
                      context, // Tambahkan context
                      title: 'SEPATU HIKING',
                      status: 'Hilang',
                      statusColor: Colors.redAccent,
                      description: 'berwarna abu abu dan hitam ....',
                      date: '9 Maret 2026 10.00 WIB',
                      imageUrl: 'https://via.placeholder.com/150', 
                    ),
                    const SizedBox(height: 20),
                    _buildItemCard(
                      context, // Tambahkan context
                      title: 'TAS HITAM',
                      status: 'Ditemukan',
                      statusColor: Colors.greenAccent,
                      description: 'Berwarna hitam merk dior, 20 juta cash, ga nyicil .....',
                      date: '9 Maret 2026 10.00 WIB',
                      imageUrl: 'https://via.placeholder.com/150',
                    ),
                  ],
                ),
              ),
            ],
          ),

          // 2. OVERLAY BLUR/GELAP
          if (isMenuOpen)
            GestureDetector(
              onTap: () => setState(() => isMenuOpen = false),
              child: Container(
                color: Colors.black.withOpacity(0.3), // Ubah ke agak gelap agar teks putih terbaca
              ),
            ),

          // 3. MENU MELAYANG
          if (isMenuOpen)
            Positioned(
              bottom: 110,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildFabMenu(Icons.search, "Menemukan"),
                  const SizedBox(height: 15),
                  _buildFabMenu(Icons.help_outline, "Kehilangan"),
                ],
              ),
            ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0900FF),
        onPressed: () => setState(() => isMenuOpen = !isMenuOpen),
        child: Icon(
          isMenuOpen ? Icons.close : Icons.add, // Ganti ke close agar lebih umum
          color: Colors.white, 
          size: 35
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }

  Widget _buildFabMenu(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A9E),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Widget kartu barang yang sudah terkoneksi
  Widget _buildItemCard(
    BuildContext context, { // Tambahkan BuildContext di sini
    required String title,
    required String status,
    required Color statusColor,
    required String description,
    required String date,
    required String imageUrl,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  status,
                  style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  imageUrl,
                  width: 120,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      description,
                      style: const TextStyle(fontSize: 12, color: Colors.black87),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    const Text('Date', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                    Text(date, style: const TextStyle(fontSize: 11)),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell( // 2. GUNAKAN INKWELL/GESTUREDETECTOR UNTUK NAVIGASI
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                title: title,
                                imageUrl: imageUrl,
                                status: status,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2B2BFF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Selengkapnya →',
                            style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}