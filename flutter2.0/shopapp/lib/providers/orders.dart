import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopapp/models/http_exception.dart';
import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime datetime;
  OrderItem(
      {required this.id,
      required this.amount,
      required this.products,
      required this.datetime});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> fetchAndSetOrder() async {
    final url =
        Uri.https('shop-app-6bf9f-default-rtdb.firebaseio.com', '/orders.json');
    final response = await http.get(url);
    if (jsonDecode(response.body) == null) {
      return;
    }
    final extrectedData = jsonDecode(response.body) as Map<String, dynamic>;

    final List<OrderItem> loadedOrders = [];
    extrectedData.forEach((orderId, orderData) {
      loadedOrders.add(
        OrderItem(
            id: orderId,
            amount: orderData['amount'],
            products: (orderData['products'] as List<dynamic>)
                .map((item) => CartItem(
                      id: item['id'],
                      price: item['price'],
                      title: item['title'],
                      quantity: item['quantity'],
                    ))
                .toList(),
            datetime: DateTime.parse(orderData['datetime'])),
      );
    });
    _orders = loadedOrders;
    notifyListeners();
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url =
        Uri.https('shop-app-6bf9f-default-rtdb.firebaseio.com', '/orders.json');
    final DateTime timestamp = DateTime.now();
    try {
      final response = await http.post(url,
          body: json.encode({
            'amount': total,
            'products': cartProducts
                .map((cp) => {
                      'id': cp.id,
                      'title': cp.title,
                      'price': cp.price,
                      'quantity': cp.quantity
                    })
                .toList(),
            'datetime': timestamp.toIso8601String(),
          }));

      if (response.statusCode >= 400) {
        throw HttpException('error');
      } else {
        _orders.insert(
            0,
            OrderItem(
                id: jsonDecode(response.body)['name'],
                amount: total,
                products: cartProducts,
                datetime: timestamp));
        notifyListeners();
      }
    } catch (error) {}
  }
}
