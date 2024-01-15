import 'package:cloud_firestore/cloud_firestore.dart';

class HostelModel {
  final String? id;
  final String nameHostel;
  final String address;
  final String? area;
  final List<String>? imgHostel;
  final String? status;
  final String? numberRoom;
  final String phoneNub;
  final String? ratingStar;
  bool isActive = true;
  final String idUSer;

  HostelModel({
    this.id,
    required this.nameHostel,
    required this.address,
    this.area,
    this.imgHostel,
    this.status,
    this.numberRoom,
    required this.phoneNub,
    this.ratingStar,
    required this.isActive,
    required this.idUSer,
  });

  toJson() {
    return {
      'id': id,
      'nameHostel': nameHostel,
      'address': address,
      'area': area,
      'imgHostel': imgHostel,
      'status': status,
      'numberRoom': numberRoom,
      'phoneNub': phoneNub,
      'ratingStar': ratingStar,
      'isActive': isActive,
      'idUSer': idUSer,
    };
  }

  factory HostelModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return HostelModel(
      id: document.id,
      nameHostel: data['nameHostel'],
      address: data['address'],
      area: data['area'],
      imgHostel: data['imgHostel'],
      status: data['status'],
      numberRoom: data['numberRoom'],
      phoneNub: data['phoneNub'],
      ratingStar: data['ratingStar'],
      isActive: data['isActive'] ?? false,
      idUSer: data['idUSer'] != null ? (data['idUSer']) : null,
    );
  }
}
