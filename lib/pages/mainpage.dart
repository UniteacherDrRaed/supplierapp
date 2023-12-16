import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflitewithcubitbeispiel/pages/addsupplier.dart';

import '../cubitpart/suppliercubit.dart';
import '../cubitpart/supplierstate.dart';
import '../supplier.dart';
class MainPage extends StatelessWidget {
   MainPage({super.key});
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

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
          print(state);
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
                    onLongPress: (){
                      _nameController.text=currentsupplier.name;
                      _addressController.text=currentsupplier.address;
                      _phoneController.text=currentsupplier.phone;
                      _emailController.text=currentsupplier.email;

                      showDialog(context: context,
                          builder: (_)=>
                      AlertDialog(
                        content: Container(
                          padding: const EdgeInsets.all(10),
                          color: Colors.pink.shade50,
                          child: Column(
                            children: [
                              TextField(
                                controller: _nameController,
                                autofocus: true,
                                maxLength: 20,
                                decoration: InputDecoration(
                                  hintStyle: const TextStyle(color: Colors.pink),
                                  hintText: "Enter Supplier Name",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.pink.shade400,
                                      ),
                                      borderRadius:
                                      const BorderRadius.all(Radius.circular(10.0))),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.orange.shade400,
                                      ),
                                      borderRadius:
                                      const BorderRadius.all(Radius.circular(15.0))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.deepOrange.shade400,
                                      ),
                                      borderRadius:
                                      const BorderRadius.all(Radius.circular(10.0))),
                                ),
                              ),
                              TextField(
                                controller: _addressController,
                                maxLength: 100,
                                decoration: InputDecoration(
                                  hintStyle: const TextStyle(color: Colors.pink),
                                  hintText: "Enter Supplier address",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.pink.shade400,
                                      ),
                                      borderRadius:
                                      const BorderRadius.all(Radius.circular(10.0))),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.orange.shade400,
                                      ),
                                      borderRadius:
                                      const BorderRadius.all(Radius.circular(15.0))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.deepOrange.shade400,
                                      ),
                                      borderRadius:
                                      const BorderRadius.all(Radius.circular(10.0))),
                                ),
                              ),
                              TextField(
                                controller: _phoneController,
                                maxLength: 20,
                                decoration: InputDecoration(
                                  hintStyle: const TextStyle(color: Colors.pink),
                                  hintText: "Enter Supplier phone",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.pink.shade400,
                                      ),
                                      borderRadius:
                                      const BorderRadius.all(Radius.circular(10.0))),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.orange.shade400,
                                      ),
                                      borderRadius:
                                      const BorderRadius.all(Radius.circular(15.0))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.deepOrange.shade400,
                                      ),
                                      borderRadius:
                                      const BorderRadius.all(Radius.circular(10.0))),
                                ),
                              ),
                              TextField(
                                controller: _emailController,
                                maxLength: 50,
                                decoration: InputDecoration(
                                  hintStyle: const TextStyle(color: Colors.pink),
                                  hintText: "Enter Supplier email",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.pink.shade400,
                                      ),
                                      borderRadius:
                                      const BorderRadius.all(Radius.circular(10.0))),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.orange.shade400,
                                      ),
                                      borderRadius:
                                      const BorderRadius.all(Radius.circular(15.0))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.deepOrange.shade400,
                                      ),
                                      borderRadius:
                                      const BorderRadius.all(Radius.circular(10.0))),
                                ),
                              ),
                              OutlinedButton.icon(
                                  onPressed: () {
                                    Supplier supplier = Supplier(
                                        id:currentsupplier.id,
                                        name: _nameController.text,
                                        address: _addressController.text,
                                        phone: _phoneController.text,
                                        email: _emailController.text);
                                    context.read<LieferanCubit>().updateSupplier(supplier);

                                    context.read<LieferanCubit>().fetchsuppliers();
                                  },
                                  icon: const Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.pink,
                                  ),
                                  label: const Text("update a supplier")),
                              OutlinedButton.icon(
                                  onPressed: () {
                                    Navigator.pop(context);

                                  },
                                  icon: const Icon(
                                    Icons.reset_tv_outlined,
                                    color: Colors.pink,
                                  ),
                                  label: const Text("return to List Of Suppliers")),
                            ],
                          ),
                        ),

                      ));
                    },
                    leading: Text("${currentsupplier.id}"),
                    title: Text(currentsupplier.name),
                    subtitle: Text(currentsupplier.email),
                    trailing:  IconButton(onPressed: (){
                      context.read<LieferanCubit>().removeSupplier(currentsupplier.id!);
                      context.read<LieferanCubit>().fetchsuppliers();
                    },
                        icon:const Icon(Icons.remove,color: Colors.blue,))
                  );
                }),
          );
        }
        ),
        floatingActionButton: FloatingActionButton.large(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>AddSupplier())
            );

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


