import 'package:cripto_coins/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../widgets/crypto_coin_tile.dart';

class CryptoCoinsScreen extends StatefulWidget {
  const CryptoCoinsScreen({super.key, required this.title});

  final String title;

  @override
  State<CryptoCoinsScreen> createState() => _CryptoCoinsScreenState();
}

class _CryptoCoinsScreenState extends State<CryptoCoinsScreen> {
  List<CryptoCoin>? _cryptoCoinsList;

  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: theme.colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: (_cryptoCoinsList == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: const EdgeInsets.only(top: 16.0),
              itemCount: _cryptoCoinsList!.length,
              separatorBuilder: (context, i) => const Divider(),
              itemBuilder: (context, i) {
                final coin = _cryptoCoinsList![i];
                return CryptoCoinTile(coin: coin);
              },
            ),
    );
  }

  Future<void> _loadCryptoCoins() async {
    _cryptoCoinsList = await GetIt.I<CryptoCoinsRepository>().getCoinsList();
    setState(() {});
  }
}
