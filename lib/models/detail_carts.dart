/// Model untuk detail item dalam Cart (Order)
class DetailCart {
  final int id;
  final String orderId;
  final String serviceId;
  final String serviceName;
  final String keterangan;
  final int quantity;
  final double price;

  DetailCart({
    required this.id,
    required this.orderId,
    required this.serviceId,
    required this.serviceName,
    required this.keterangan,
    required this.quantity,
    required this.price,
  });

  double get subTotal => quantity * price;

  factory DetailCart.fromJson(Map<String, dynamic> json) => DetailCart(
    id: json['id'] as int,
    orderId: json['order_id'] as String,
    serviceId: json['service_id'] as String,
    serviceName: json['service_name'] as String,
    keterangan: json['keterangan'] as String,
    quantity: json['quantity'] as int,
    price: (json['price'] as num).toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'order_id': orderId,
    'service_id': serviceId,
    'service_name': serviceName,
    'keterangan': keterangan,
    'quantity': quantity,
    'price': price,
  };
}
