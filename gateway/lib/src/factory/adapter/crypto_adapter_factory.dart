import 'package:gateway/src/adapter/crypto_adapter/crypto_adapter_impl.dart';
import 'package:gateway/src/adapter/crypto_adapter/protocol/crypto_adapter.dart';

class CryptoAdapterFactory {
  static CryptoAdapter make() {
    return CryptoAdapterImpl();
  }
}