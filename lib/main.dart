class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 1;

  final List<Widget> _pages = [
    const HistoryPage(),
    const HomePage(), // Pastikan HomePage di sini tidak punya BottomNav lagi
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true membuat body bisa "mengintip" di balik navigasi jika transparan
      extendBody: true, 
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      
      // Tombol tambah diletakkan di MainScreen agar tidak menumpuk
      floatingActionButton: _currentIndex == 1 ? FloatingActionButton(
        backgroundColor: const Color(0xFF0900FF),
        shape: const CircleBorder(),
        onPressed: () {
          // Logika buka menu atau tambah barang
        },
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ) : null, // Hanya muncul jika di tab Beranda

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          selectedItemColor: const Color(0xFF0900FF),
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.history_rounded), label: 'History'),
            BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Beranda'),
            BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profil'),
          ],
        ),
      ),
    );
  }
}