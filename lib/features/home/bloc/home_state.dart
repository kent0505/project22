part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadedState extends HomeState {
  final int coins;
  final int gems;
  HomeLoadedState({
    required this.coins,
    required this.gems,
  });
}
