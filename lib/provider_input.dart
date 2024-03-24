import 'package:flutter/material.dart';

class UserDataProvider extends ChangeNotifier {
  int age = 0;
  int cigarettesPerDay = 0;
  double pricePerCigarette = 0.0;
  DateTime quitDate = DateTime.now();
  double savedMoney = 0.0;
  int cigarettesAvoided = 0;

  void updateUserInput({
    required int age,
    required int cigarettesPerDay,
    required double pricePerCigarette,
    required DateTime quitDate,
    required double savedMoney,
    required int cigarettesAvoided,
  }) {
    this.age = age;
    this.cigarettesPerDay = cigarettesPerDay;
    this.pricePerCigarette = pricePerCigarette;
    this.quitDate = quitDate;
    this.savedMoney = savedMoney;
    this.cigarettesAvoided = cigarettesAvoided;

    notifyListeners();
  }

  void setAge(int age) {
    this.age = age;
    notifyListeners();
  }
  void setCigarettesPerDay(int cigarettesPerDay) {
    this.cigarettesPerDay = cigarettesPerDay;
    notifyListeners();
  }
 void setPricePerCigaratte(double pricePerCigarette) {
    this.pricePerCigarette = pricePerCigarette;
    notifyListeners();
 }
 void setQuitedate(DateTime quitDate) {
    this.quitDate = quitDate;
    notifyListeners();
 }
}

