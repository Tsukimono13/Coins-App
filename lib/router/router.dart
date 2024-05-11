import 'package:cripto_coins/features/crypto_coin/crypto_coin.dart';
import 'package:cripto_coins/features/crypto_list/crypto_list.dart';

final routes = {
  '/': (context) => const CryptoCoinsScreen(title: 'Coins App'),
  '/coin': (context) => const CryptoCoinScreen(title: 'Bitcoin'),
};
