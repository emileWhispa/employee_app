import 'package:sqflite/sqflite.dart';

class Employee {
  String name;
  String email;
  String phone;
  String password;

  Employee.fromDb(Map<String, dynamic> map)
      : name = map['name'],
        email = map['email'],
        phone = map['phone'],
        password = map['password'];



  static Database? dbContext;
}
