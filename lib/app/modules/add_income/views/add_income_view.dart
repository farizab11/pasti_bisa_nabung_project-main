import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_cash_book/app/utils/app_color.dart';
import 'package:my_cash_book/app/widgets/custom_input.dart';

import '../controllers/add_income_controller.dart';

// ignore: must_be_immutable
class AddIncomeView extends GetView<AddIncomeController> {
  late double mWidth;
  late double mHeight;
  @override
  Widget build(BuildContext context) {
    mWidth = MediaQuery.of(context).size.width;
    mHeight = MediaQuery.of(context).size.height / 1.2;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text('Tambah Pemasukan'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: mHeight,
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomInput(
                      controller: controller.dateC,
                      label: "Tanggal",
                      hint: "Pilih tanggal",
                      suffixIcon: const Icon(
                        Icons.date_range,
                        color: Colors.black,
                      ),
                      isDate: true,
                    ),
                    CustomInput(
                      controller: controller.nominalC,
                      label: "Jumlah",
                      hint: "Masukkan Nominal",
                      suffixIcon: const Icon(
                        Icons.money,
                        color: Colors.black,
                      ),
                      isNumber: true,
                      isNominal: true,
                    ),
                    CustomInput(
                      controller: controller.descriptionC,
                      label: "Keterangan",
                      hint: "Masukkan keterangan",
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (controller.isLoading.isFalse) {
                        await controller.resetForm();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      elevation: 0,
                      primary: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Reset',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (controller.isLoading.isFalse) {
                          await controller.addIncome();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        elevation: 0,
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        (controller.isLoading.isFalse)
                            ? 'Simpan'
                            : 'Loading...',
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'poppins',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () async {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      elevation: 0,
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Kembali',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'poppins',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
