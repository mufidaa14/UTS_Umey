class Order {
  final String customerName;
  final String productName;
  final String quantity;
  final String date;  // Ideally this would be a DateTime, but keeping it String for simplicity as per requirements
  final String size;
  final String deadline;

  Order({
    required this.customerName,
    required this.productName,
    required this.quantity,
    required this.date,
    required this.size,
    required this.deadline,
  });
}

// Global list to store orders
List<Order> orderList = [];
