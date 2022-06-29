part of 'services.dart';

class RegionServices {
  static Future<ApiReturnValue<List<Region>>> getRegions(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + 'regencies';

    var response = await client.get(url);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);
    print(data);
    List<Region> regions =
        (data as Iterable).map((e) => Region.fromJson(e)).toList();

    return ApiReturnValue(value: regions);
  }
}
