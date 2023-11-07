part of 'stores_bloc.dart';

@immutable
abstract class StoresEvent {}

class FetchMyStoresEvent extends StoresEvent {}

class FetchStoresEvent extends StoresEvent {}
