import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflitewithcubitbeispiel/supplier.dart';

import '../cubitpart/suppliercubit.dart';
import '../cubitpart/supplierstate.dart';
import 'mainpage.dart';

class AddSupplier extends StatelessWidget {
  AddSupplier({super.key});

  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => LieferanCubit()),
        ],
        child: BlocProvider(
          create: (BuildContext context) => LieferanCubit(),
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Add a Supplier"),
              centerTitle: true,
              backgroundColor: Colors.pink,
            ),
            body: BlocBuilder<LieferanCubit, LieferantZustand>(
                builder: (BuildContext context, LieferantZustand state) {
                  return Container(
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
                                  name: _nameController.text,
                                  address: _addressController.text,
                                  phone: _phoneController.text,
                                  email: _emailController.text);
                              context.read<LieferanCubit>().addSupplier(supplier);

                            },
                            icon: const Icon(
                              Icons.add_circle_outline,
                              color: Colors.pink,
                            ),
                            label: const Text("save a supplier")),
                        OutlinedButton.icon(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context)=>MainPage()));
                            },
                            icon: const Icon(
                              Icons.reset_tv_outlined,
                              color: Colors.pink,
                            ),
                            label: const Text("return to List Of Suppliers")),
                      ],
                    ),
                  );
                }),
          ),
        ));
  }
}
