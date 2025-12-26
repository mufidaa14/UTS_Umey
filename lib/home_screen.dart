import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1; // Default to Home

  final List<Map<String, String>> products = [
    {
      'name': 'BAJU ATASAN PRIA',
      'image': 'assets/BAJU ATASAN PRIA.jpg',
      'price': 'Rp. 50.000',
    },
    {
      'name': 'BAJU ATASAN WANITA',
      'image': 'assets/BAJU ATASAN WANITA.jpg',
      'price': 'Rp. 55.000',
    },
    {
      'name': 'BAJU ONE SET WANITA',
      'image': 'assets/BAJU ONE SET WANITA.jpg',
      'price': 'Rp. 130.000',
    },
    {
      'name': 'BAJU SARIMBIT',
      'image': 'assets/BAJU SARIMBIT.jpg',
      'price': 'Rp. 250.000',
    },
    {
      'name': 'CELANA COWOK',
      'image': 'assets/celana cowok.jpg',
      'price': 'Rp. 90.000',
    },
    {
      'name': 'CELANA WANITA',
      'image': 'assets/CELANA WANITA.jpg',
      'price': 'Rp. 85.000',
    },
    {
      'name': 'KERUDUNG',
      'image': 'assets/kerudung.jpg',
      'price': 'Rp. 35.000',
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                // Header Image
                SizedBox(
                  width: double.infinity,
                  height: 220, // Adjust height as needed
                  child: Image.asset(
                    'assets/header home.png',
                    fit: BoxFit.cover,
                  ),
                ),
                // Floating Welcome Card
                Positioned(
                  bottom: -30,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0E0E0), // Light grey like reference
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/logo.png', // Small logo inside card
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(width: 15),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Selamat Datang!',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Siap mengelola jadwal produksi Anda hari ini',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50), // Space for floating card

            // Product Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.75, // Adjust card aspect ratio
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return _buildProductCard(products[index]);
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Daftar\nPesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Map<String, String> product) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5), // Light grey background for card
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Product Image
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                product['image']!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Product Name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              product['name']!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // Product Price
          Text(
            product['price']!,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          
          // Action Row
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: const BoxDecoration(
               color: Color(0xFFE0E0E0),
               borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Pesan Button
                GestureDetector(
                    onTap: () {
                         // TODO: Implement Order Action
                    },
                    child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                        color: const Color(0xFFFF5252), // Red Color
                        borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                        'Pesan',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold
                        ),
                    ),
                    ),
                ),
                // Quantity Stepper
                Row(
                  children: [
                    _buildStepperButton('-'),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text('1', style: TextStyle(fontSize: 12)),
                    ),
                    _buildStepperButton('+'),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStepperButton(String label) {
    return Container(
      width: 18,
      height: 18,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        label,
        style: const TextStyle(
            fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54),
      ),
    );
  }
}
