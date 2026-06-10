import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  final String baseUrl = 'https://dummyjson.com';

  Future<List<Product>> getProducts(String category) async {
    final String url = category == 'all'
        ? '$baseUrl/products?limit=20'
        : '$baseUrl/products/category/$category';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List productsJson = data['products'];
      return productsJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Gagal mengambil data produk');
    }
  }

  Future<Product> addProduct(Product product) async {
    final response = await http.post(
      Uri.parse('$baseUrl/products/add'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(product.toJson()),
    );
    if (response.statusCode == 201) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal Menambah produk');
    }
  }
}