part of 'crypto_list_bloc.dart';

class CryptoListState {}

class CryptoListInitial extends CryptoListState {}

class CryptoListLoading extends CryptoListState {}

class CryptoListLoaded extends CryptoListState {
  CryptoListLoaded({required this.coinsList});

  final List<CryptoCoin> coinsList;
}

class CryptoListLoadingError extends CryptoListState {
  CryptoListLoadingError({required this.exception});
  final Object? exception;
}
