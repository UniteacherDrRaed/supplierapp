import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflitewithcubitbeispiel/cubitpart/supplierstate.dart';

import '../supplier.dart';


class LieferanCubit extends Cubit<LieferantZustand>{
  LieferanCubit():super(Anfangszustand());

  List<Supplier> allsuppliers=[ ];
  TextEditingController nameController=TextEditingController();
  TextEditingController addressController=TextEditingController();
  TextEditingController phoneController=TextEditingController();

  static Future<Database> supplierDatase() async{

    return openDatabase(
        join(await getDatabasesPath(),"liefeant_database.db"),
        version: 1,
        onCreate: (Database db,int version ){
          return db.execute('''
        create table supplier(
         id integer primary key autoincrement,
         name varchar(20),
         address varchar(100),
         phone varchar(20),
         email varchar(50))
        ''',);
        }
    );
  }

  addSupplier(Supplier singlesupplier) async{
    Database database=await LieferanCubit.supplierDatase();
    try {
      await database.insert('supplier', singlesupplier.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,);
      print("added");
      emit(EinfuegenLieferantMitErfolgZustand());
    }catch(e)
    {
      emit(EinfuegenLieferantFehlerZustand());
      print(e);
    }
  }
  f()
  {
    addSupplier(Supplier(name: "name1", address: "address1", phone: "phone1", email: "email"));
    addSupplier(Supplier(name: "name2", address: "address1", phone: "phone1", email: "email"));
  }
  Future<List<Supplier>> fetchsuppliers() async{

    Database database=await LieferanCubit.supplierDatase();
    try {
      List<Map<String,dynamic>> suppliers= await database.query('supplier');
      print(suppliers);
      emit(HerbeiholenLieferantMitErfolgZustand());
      allsuppliers= List.generate(suppliers.length, (index) =>
          Supplier(id:suppliers[index]['id'] as int,
              name: suppliers[index]['name'] as String,
              address: suppliers[index]['address'] as String,
              phone: suppliers[index]['phone'] as String,
              email: suppliers[index]['email'] as String));
      return allsuppliers;


    }catch(e)
    {
      List<Supplier> emptylist=[];
      emit(HerbeiholenLieferantFehlerZustand());
      print(e);
      return emptylist;
    }
  }
}