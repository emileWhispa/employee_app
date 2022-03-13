import 'package:employee_app/create_employee_screen.dart';
import 'package:employee_app/json/employee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  List<Employee> _list = [];

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      loadData();
    });
    super.initState();
  }

  void loadData()async{
    var list = await Employee.dbContext!.query("employees");
    setState(() {
      _list = list.map((e) => Employee.fromDb(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employees"),
      ),
      body: ListView.builder(itemBuilder: (context,index){
        var _item = _list[index];
        return ListTile(
          title: Text(_item.name),
          subtitle: Text(_item.email),
        );
      },itemCount: _list.length,),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
         await Navigator.push(context, CupertinoPageRoute(builder: (context)=>CreateEmployeeScreen()));
         loadData();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}