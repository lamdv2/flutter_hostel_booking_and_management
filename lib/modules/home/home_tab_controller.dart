import 'package:flutter/material.dart';
import 'package:flutter_getx_base/models/hostel/hostel_model.dart';
import 'package:get/get.dart';

class HomeTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TextEditingController searchHomeController = TextEditingController();

  final listTourCurrentTabs = Rxn<List<HostelModel>>(
    [
      HostelModel(
        nameHostel: "nameHostel",
        address: "address",
        phoneNub: "phoneNub",
        isActive: true,
        idUSer: "idUSer",
      ),
      HostelModel(
        nameHostel: "nameHostel",
        address: "address",
        phoneNub: "phoneNub",
        isActive: true,
        idUSer: "idUSer",
      ),
      HostelModel(
        nameHostel: "nameHostel",
        address: "address",
        phoneNub: "phoneNub",
        isActive: true,
        idUSer: "idUSer",
      ),
    ],
  );
}
