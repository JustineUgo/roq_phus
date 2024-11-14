import 'package:injectable/injectable.dart';
import 'package:sisyphus/src/services/network_service.dart';
import 'package:sisyphus/util/urls.dart';

abstract class Repo {
  Future<List<dynamic>> getCandlesticks({required String interval});
  Future<List<dynamic>> getPrice();
}

@Singleton(as: Repo)
class RepoImpl implements Repo {
  final NetworkService request;
  RepoImpl({required this.request});

  @override
  Future<List<dynamic>> getCandlesticks({required String interval}) async {
    return await request.makeRequest(
        Urls.kLines(interval: interval),
        mode: NetworkMethod.get);
  }

  @override
  Future<List<dynamic>> getPrice() async {
    return await request.makeRequest(Urls.price, mode: NetworkMethod.get);
  }
}
