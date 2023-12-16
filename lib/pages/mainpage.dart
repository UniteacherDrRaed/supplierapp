import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflitewithcubitbeispiel/pages/addsupplier.dart';

import '../cubitpart/suppliercubit.dart';
import '../cubitpart/supplierstate.dart';
import '../supplier.dart';
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(BuildContext context) => LieferanCubit()..fetchsuppliers(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Suppliers"),
          centerTitle: true,
          backgroundColor: Colors.pink,
        ),
        body:  BlocBuilder<LieferanCubit, LieferantZustand>(
        builder: (BuildContext context, LieferantZustand state) {
          List<Supplier> listsuppliers =
              context
                  .watch<LieferanCubit>()
                  .allsuppliers;
          return Container(
            color: Colors.pink.shade50,
            padding: EdgeInsets.all(10),
            child: ListView.builder(
                itemCount: listsuppliers.length,
                itemBuilder: (context, indexsupplier) {
                  Supplier currentsupplier = listsuppliers[indexsupplier];
                  return ListTile(
                    leading: Text("${currentsupplier.id}"),
                    title: Text(currentsupplier.name),
                    subtitle: Text(currentsupplier.email),
                  );
                }),
          );
        }
        ),
        floatingActionButton: FloatingActionButton.large(
          onPressed: () {

          },
          child: const Icon(
            Icons.add_circle_outline,
            color: Colors.pink,
          ),
        ),
    ),
    );
  }
}


