import 'package:gateway/src/adapter/crypto_adapter/protocol/crypto_algorithm.dart';

abstract class CryptoAdapter {
  Future<String> encrypt(CryptoAlgorithm algorithm, { required String cipher, required String content });
}