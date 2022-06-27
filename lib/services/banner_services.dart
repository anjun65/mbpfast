part of 'services.dart';

class BannerServices {
  
  static Future<ApiReturnValue<List<BannerModel>>> getBanners(
      {http.Client client}) async {
    client ??= http.Client();
    print('keluarr test');

    String url = baseURL + 'banners';
    print(url);
    var response = await client.get(url);
    
    print(response);
    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);
    print(data);

    List<BannerModel> banners = (data['data'] as Iterable)
        .map((e) => BannerModel.fromJson(e))
        .toList();

    return ApiReturnValue(value: banners);
  }
}