import 'package:flutter/material.dart';
import 'package:uts_umey/order_data.dart';

class DaftarPesananScreen extends StatelessWidget {
  const DaftarPesananScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Daftar Pesanan',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFFFC0CB), // Soft Pink
        elevation: 0,
        automaticallyImplyLeading: false, // Hide back button as it's a main tab
      ),
      body: orderList.isEmpty
          ? const Center(child: Text('Belum ada pesanan'))
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: orderList.length,
              itemBuilder: (context, index) {
                final order = orderList[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey[300], // Light grey background
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Number Circle
                      Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      // Order Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.customerName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '${order.productName}\n${order.date}', // Multiline
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      // Quantity
                      Text(
                        '${order.quantity} pcs',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
