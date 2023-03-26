import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class EtudiantModel {
  final String id;
  final String name;
  final String lastname;
  final int niveau;
  final int  age;

  EtudiantModel(this.id, this.name, this.lastname, this.niveau, this.age);


  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'last name': lastname,
      'niveau':niveau,
      'age':age,
      
    };
  }

  // factory EtudiantModel.fromJson(Map<String, dynamic> json) {
  //   return EtudiantModel(
  //   id:json['id'],
  //   name:json['name'],
  //   lastname:json['lastname'],
  //   niveau:json['niveau'],
  //   age:json['age'],
  //   id: json['id'],
  //   );
  // }
}
