class Supplier{
  int? id;
  final String name;
  final String address;
  final String phone;
  final String email;
  Supplier({this.id, required this.name,
    required this.address,
    required this.phone,
    required this.email});
  Map<String,dynamic> toMap(){
    return {
      'id':id, 'name':name, 'address':address, 'phone':phone, 'email':email
    };
  }
}