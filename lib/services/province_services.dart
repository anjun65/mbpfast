part of 'services.dart';

class ProvinceServices {
  static Future<ApiReturnValue<List<Province>>> getProvinces(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + 'provinces';

    var response = await client.get(url);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);
    print(data);
    List<Province> provinces =
        (data as Iterable).map((e) => Province.fromJson(e)).toList();
    print(provinces);

    return ApiReturnValue(value: provinces);
  }
}
