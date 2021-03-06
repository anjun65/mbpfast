import 'dart:convert';
import 'dart:io';

import 'package:mbpfast/models/models.dart';
import 'package:http/http.dart' as http;

part 'user_services.dart';
part 'food_services.dart';
part 'banner_services.dart';
part 'category_services.dart';
part 'transaction_services.dart';
part 'cart_services.dart';
part 'province_services.dart';
part 'region_services.dart';

String baseURL = 'https://market.mbpfast.com/api/';
