import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  // var _shoFevoritesOnly = false;
  List<Product> get items {
    // if (_shoFevoritesOnly) {
    //   return _items.where((productItem) => productItem.isFevorite).toList();
    // }
    return [..._items];
  }

  List<Product> get fevoritesItem {
    return _items.where((proditem) => proditem.isFevorite).toList();
  }

  Future<void> addProduct(Product product) {
    final url = Uri.https(
        'shopapp-668e9-default-rtdb.firebaseio.com', '/products.json');
    return http
        .post(url,
            body: json.encode({
              'title': product.title,
              'description': product.description,
              'price': product.price,
              'imageUrl': product.imageUrl,
              'isFevorits': product.isFevorite,
            }))
        .then((response) {
      final newProduct = Product(
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
        id: json.decode(response.body)['name'],
      );
      _items.add(newProduct);

      // _items.add(value);
      notifyListeners();
    });
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // void showFevoritesOnly() {
  //   _shoFevoritesOnly = true;
  //   notifyListeners();
  // }

  // void showFevoritesAll() {
  //   _shoFevoritesOnly = false;
  //   notifyListeners();
  // }
  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('Unable to add product');
    }
  }

  void deleteProduct(String id) {
    if (id.isNotEmpty) {
      _items.removeWhere((prod) => prod.id == id);
      notifyListeners();
    }
  }
}
