import 'package:http/http.dart' as http;

class ProductApi {
  static Future getProducts() {
    Uri? url = Uri.tryParse("http://10.0.2.2:3000/products");
    return http.get(url!);
  }

  static Future getProductsByCategoryId(int? categoryId) {
    Uri? url =
        Uri.tryParse("http://10.0.2.2:3000/products?categoryId=$categoryId");
    return http.get(url!);
  }
}
