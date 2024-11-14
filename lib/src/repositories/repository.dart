import 'package:injectable/injectable.dart';
import 'package:sisyphus/src/services/network_service.dart';
import 'package:sisyphus/util/urls.dart';

abstract class Repo {
  Future<List<dynamic>> getCandlesticks(
      {required String symbol, required String interval});
}

@Singleton(as: Repo)
class RepoImpl implements Repo {
  final NetworkService request;
  RepoImpl({required this.request});

  @override
  Future<List<dynamic>> getCandlesticks(
      {required String symbol, required String interval}) async {
    return await request.makeRequest(
        Urls.kLines(symbol: symbol, interval: interval),
        mode: NetworkMethod.get);
  }

}
