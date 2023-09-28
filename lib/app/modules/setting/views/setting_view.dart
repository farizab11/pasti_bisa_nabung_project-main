import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:my_cash_book/app/routes/app_pages.dart';
import 'package:my_cash_book/app/utils/app_color.dart';
import 'package:my_cash_book/app/widgets/custom_input.dart';

import '../controllers/setting_controller.dart';

// ignore: must_be_immutable
class SettingView extends GetView<SettingController> {
  late double mWidth;
  late double mHeight;
  @override
  Widget build(BuildContext context) {
    mWidth = MediaQuery.of(context).size.width;
    mHeight = MediaQuery.of(context).size.height / 1.2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Setting'),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        height: mHeight / 4,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Image.asset(
              "assets/images/foto.png",
              width: mWidth / 3,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tentang Aplikasi Ini",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("Nama\t\t\t\t: Fariz Al Baihaqi"),
                Text("NIM\t\t\t\t\t\t\t: 21414764074"),
                Text("Jurusan\t: D4 Sistem Informasi Bisnis"),
                Text("Dibuat\t\t\t\t: 25 September 2023"),
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: mHeight,
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ganti Password',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => CustomInput(
                  controller: controller.passC,
                  label: "Password Saat Ini",
                  hint: "Masukkan passwordmu saat ini",
                  obsecureText: controller.obsecureText.value,
                  suffixIcon: IconButton(
                    icon: (controller.obsecureText != false)
                        ? SvgPicture.asset('assets/icons/show.svg')
                        : SvgPicture.asset('assets/icons/hide.svg'),
                    onPressed: () {
                      controller.obsecureText.value =
                          !(controller.obsecureText.value);
                    },
                  ),
                ),
              ),
              Obx(
                () => CustomInput(
                  controller: controller.passNewC,
                  label: "Password Baru",
                  hint: "Masukkan password yang baru ",
                  obsecureText: controller.obsecureTextNew.value,
                  suffixIcon: IconButton(
                    icon: (controller.obsecureTextNew != false)
                        ? SvgPicture.asset('assets/icons/show.svg')
                        : SvgPicture.asset('assets/icons/hide.svg'),
                    onPressed: () {
                      controller.obsecureTextNew.value =
                          !(controller.obsecureTextNew.value);
                    },
                  ),
                ),
              ),
              Obx(
                () => Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (controller.isLoading.isFalse) {
                        await controller.changePassword();
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
                      (controller.isLoading.isFalse) ? 'Simpan' : 'Loading...',
                      style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
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
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
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
                    Get.offAllNamed(Routes.LOGIN);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    elevation: 0,
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
