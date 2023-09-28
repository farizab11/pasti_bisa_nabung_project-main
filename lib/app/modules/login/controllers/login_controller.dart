import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_cash_book/app/routes/app_pages.dart';
import 'package:my_cash_book/app/utils/app_color.dart';
import 'package:my_cash_book/app/utils/database_helper.dart';
import 'package:my_cash_book/app/utils/hash_password.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool obsecureText = true.obs;
  TextEditingController usernameC = TextEditingController();
  TextEditingController passC = TextEditingController();

  @override
  void onInit() {
    final hashedPassword = HashPassword('admin');
    DatabaseHelper.instance.addUser("admin", hashedPassword);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> login() async {
    final username = usernameC.text;
    final password = passC.text;

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Login kamu Gagal',
        'Masukkan username atau passwordmu dengan benar',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.warning,
        colorText: Color.fromARGB(255, 8, 8, 8),
      );
      return;
    }

    try {
      final isLoginSuccessful =
          await DatabaseHelper.instance.login(username, password);

      if (isLoginSuccessful) {
        Get.offNamed(Routes.HOME);
        Get.snackbar(
          'Halo Selamat Datang',
          'SEMANGAT MENABUNGNYA',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.purple,
          colorText: Colors.white,
        );
      } else {
        // Tampilkan pesan error jika login gagal
        Get.snackbar(
          'Login Gagal',
          'Username atau password salah',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColor.secondary,
          colorText: Colors.white,
        );
      }
    } catch (error) {
      // Tampilkan pesan error jika terjadi error
      Get.snackbar(
        'Error',
        'Terjadi kesalahan: $error',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.secondary,
        colorText: Colors.white,
      );
    }
  }
}
