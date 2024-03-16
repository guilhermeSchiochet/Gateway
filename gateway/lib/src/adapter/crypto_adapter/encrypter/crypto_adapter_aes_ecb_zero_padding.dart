import 'dart:convert';
import 'package:cryptography/cryptography.dart';
import 'package:gateway/src/adapter/crypto_adapter/encrypter/crypto_generator.dart';

/// Classe responsável pela criptografia de dados utilizando o algoritmo AES no modo CBC com HMAC-SHA256.
/// Implementa a interface CryptoGenerator para fornecer uma abordagem padronizada para a criptografia.
class CryptoAdapterAesCbcHmacSha256 implements CryptoGenerator {
 @override
 Future<String> generate(String cipher, String content) async {
    final algorithm = AesCbc.with128bits(macAlgorithm: Hmac.sha256());
    final secretKey = await algorithm.newSecretKey();
    final nonce = algorithm.newNonce();

    final secretBox = await algorithm.encrypt(
      utf8.encode(content),
      secretKey: secretKey,
      nonce: nonce,
    );

    // Combina o nonce, o texto cifrado e o MAC em uma única string
    final combined = utf8.encode('$nonce${secretBox.cipherText}${secretBox.mac.bytes}');
    return base64.encode(combined);
 }
}