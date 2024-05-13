import 'dart:async';

import 'package:cripto_coins/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:cripto_coins/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../widgets/crypto_coin_tile.dart';

class CryptoCoinsScreen extends StatefulWidget {
  const CryptoCoinsScreen({super.key, required this.title});

  final String title;

  @override
  State<CryptoCoinsScreen> createState() => _CryptoCoinsScreenState();
}

class _CryptoCoinsScreenState extends State<CryptoCoinsScreen> {
  final _cryptoListBloc = CryptoListBloc(GetIt.I<CryptoCoinsRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
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
        body: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
            _cryptoListBloc.add(LoadCryptoList(completer: completer));
            completer.future;
          },
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
              bloc: _cryptoListBloc,
              builder: (context, state) {
                if (state is CryptoListLoaded) {
                  return ListView.separated(
                    padding: const EdgeInsets.only(top: 16.0),
                    itemCount: state.coinsList.length,
                    separatorBuilder: (context, i) => const Divider(),
                    itemBuilder: (context, i) {
                      final coin = state.coinsList[i];
                      return CryptoCoinTile(coin: coin);
                    },
                  );
                }
                if (state is CryptoListLoadingError) {
                  return Center(
                    child: Column(
                      children: [
                        Text('Something went wrong',
                            style: theme.textTheme.labelSmall),
                        Text('Please try again later',
                            style: theme.textTheme.bodySmall),
                        const SizedBox(height: 30),
                        TextButton(
                            onPressed: () {
                              _cryptoListBloc.add(LoadCryptoList());
                            },
                            child: const Text('Try again'))
                      ],
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              }),
        ));
  }
}
