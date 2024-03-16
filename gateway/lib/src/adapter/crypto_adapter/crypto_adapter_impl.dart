import 'package:gateway/src/adapter/crypto_adapter/encrypter/crypto_adapter_aes_ecb_zero_padding.dart';
import 'package:gateway/src/adapter/crypto_adapter/encrypter/crypto_generator.dart';
import 'package:gateway/src/adapter/crypto_adapter/protocol/crypto_adapter.dart';
import 'package:gateway/src/adapter/crypto_adapter/protocol/crypto_algorithm.dart';

/// Classe responsável por implementar a interface CryptoAdapter, fornecendo uma abordagem padronizada para a criptografia de dados.
/// Utiliza diferentes implementações de CryptoGenerator dependendo do algoritmo de criptografia especificado.
class CryptoAdapterImpl implements CryptoAdapter {
 /// Realiza a criptografia de um conteúdo utilizando o algoritmo especificado.
 ///
 /// @param algorithm O algoritmo de criptografia a ser utilizado.
 /// @param cipher A chave de criptografia.
 /// @param content O conteúdo a ser criptografado.
 /// @return Uma Future<String> representando o conteúdo criptografado.
 @override
 Future<String> encrypt(CryptoAlgorithm algorithm, { required String cipher, required String content }) async {
    final generator = _makeGenerator(algorithm);
    return generator.generate(cipher, content);
 }

 /// Cria uma instância de CryptoGenerator com base no algoritmo de criptografia especificado.
 ///
 /// @param algorithm O algoritmo de criptografia para o qual o gerador será criado.
 /// @return Uma instância de CryptoGenerator.
 CryptoGenerator _makeGenerator(CryptoAlgorithm algorithm) {
    switch(algorithm) {
      case CryptoAlgorithm.CbcHmacSha256:
        return CryptoAdapterAesCbcHmacSha256();
      default:
        throw ("Crypto generator not found for algorithm");
    }
 }
}
