library swagger.api;

import 'dart:async';
import 'dart:convert';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';

part 'api/expence_api.dart';
part 'api/order_api.dart';
part 'api/product_api.dart';
part 'api/user_api.dart';
part 'api/weather_forecast_api.dart';
part 'model/delete_response.dart';
part 'model/error_response.dart';
part 'model/expence_place_request.dart';
part 'model/expence_place_response.dart';
part 'model/expence_request.dart';
part 'model/expence_response.dart';
part 'model/order_request.dart';
part 'model/order_response.dart';
part 'model/product_request.dart';
part 'model/product_response.dart';
part 'model/product_type_request.dart';
part 'model/product_type_response.dart';
part 'model/save_response.dart';
part 'model/user_request.dart';
part 'model/user_response.dart';
part 'model/weather_forecast.dart';

ApiClient defaultApiClient = ApiClient();
