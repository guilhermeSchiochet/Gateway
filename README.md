# Gateway

Gateway é um pacote Flutter desenvolvido para facilitar o envio e retorno de requisições HTTP utilizando a biblioteca Dio. Ele oferece uma interface simples e poderosa para lidar com chamadas de API em aplicativos Flutter.

## Instalação

Para instalar o pacote Gateway, adicione a seguinte linha ao seu arquivo `pubspec.yaml`:

```yaml
dependencies:
  gateway:
    git:
      url: https://github.com/guilhermeSchiochet/Gateway.git
      path: gateway
      ref: develop
```

Em seguida, execute `flutter pub get` para instalar as dependências.

## Como usar

### Enviando uma requisição

```dart
void main() async {
  dynamic response = await GatewayConnector.call(
    GatewayCallDto(
      url: '...',
      typeRequest: GatewayTypeRequest.POST,
    )
  );
  
  print(response);
}
```

## Contribuindo

Ficamos felizes em receber contribuições! Para contribuir com o projeto Gateway, siga estas etapas:

1.  Fork o repositório e clone o fork em sua máquina local.

2.  Crie uma nova branch para sua funcionalidade ou correção de bug: `git checkout -b feature-nova-funcionalidade`.

3.  Faça suas alterações e adicione testes, se aplicável.

4.  Certifique-se de seguir as diretrizes de estilo de código.

5.  Execute os testes para garantir que tudo está funcionando corretamente: `flutter test`.

6.  Commit suas alterações: `git commit -m 'Adicionando nova funcionalidade'`.

7.  Envie suas alterações para o seu fork: `git push origin feature-nova-funcionalidade`.

8.  Abra um Pull Request para o repositório principal.

## Licença

Este projeto está licenciado sob a [Licença MIT](LICENSE).

