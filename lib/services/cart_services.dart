part of 'services.dart';

class CartServices {
  
  static Future<ApiReturnValue<List<Cart>>> getCarts(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + 'cart';

    var response = await client.get(url);
    
    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    List<Cart> carts = (data['data'] as Iterable)
        .map((e) => Cart.fromJson(e))
        .toList();

    return ApiReturnValue(value: carts);
  }
}