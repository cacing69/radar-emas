import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:radar_emas/core/network/api_client.dart';

part 'logam_mulia_api.g.dart';

@RestApi(baseUrl: 'https://logam-mulia-api.iamutaki.workers.dev')
abstract class LogamMuliaApi {
  factory LogamMuliaApi() => _LogamMuliaApi(
    ApiClient.create('https://logam-mulia-api.iamutaki.workers.dev').dio,
  );

  @GET('/api/prices')
  Future<HttpResponse<dynamic>> getSources();

  @GET('/api/prices/{source}')
  Future<HttpResponse<dynamic>> getPrices(@Path('source') String source);

  @GET('/api/prices/{source}/history')
  Future<HttpResponse<dynamic>> getPriceHistories(
    @Path('source') String source,
    @Queries() Map<String, dynamic> queries,
  );
}
