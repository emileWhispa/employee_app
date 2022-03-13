import 'package:employee_app/json/employee.dart';
import 'package:flutter/material.dart';

class CreateEmployeeScreen extends StatefulWidget{
  @override
  State<CreateEmployeeScreen> createState() => _CreateEmployeeScreenState();
}

class _CreateEmployeeScreenState extends State<CreateEmployeeScreen> {

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Create Employee"),
    ),body: ListView(
      children: [

        TextFormField(controller: nameController,decoration: const InputDecoration(
            hintText: "Names"
        ),),

        TextFormField(controller: phoneController,decoration: const InputDecoration(
            hintText: "Phone"
        ),),

        TextFormField(controller: emailController,decoration: const InputDecoration(
            hintText: "Email"
        ),),

        TextFormField(controller: passwordController,decoration: const InputDecoration(
            hintText: "Password"
        ),),

        ElevatedButton(onPressed: () async {
          await Employee.dbContext!.insert("employees", {
            "name":nameController.text,
            "email":emailController.text,
            "phone":phoneController.text,
            "password":passwordController.text,
          });
          Navigator.pop(context);
        }, child: const Text("Save")),
      ],
    ),);
  }
}