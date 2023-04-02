import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ss_test/constants/project_custom_colors.dart';
import 'package:ss_test/constants/project_images.dart';
import 'package:ss_test/constants/project_paddings.dart';
import 'package:ss_test/constants/project_text_styles.dart';
import 'package:ss_test/constants/text_field_input_decorations.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: ProjectPaddings().only_top_95,
        child: Center(
          child: SizedBox(
            width: 450,
            child: Column(
              children: [
                Image.asset(PngImage().contentIcon2),
                SizedBox(
                  height: 25,
                ),
                Text("Şifremi Unuttum",
                    style: ProjectTextStyles().darkBlue_w600_s30),
                SizedBox(height: 35),
                Text("Endişelenmeyin, size sıfırlama bağlantısı göndereceğiz."),
                SizedBox(
                  height: 35,
                ),
                Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email"),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecorators().EmailInput,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ProjectCustomColors().customPurple,
                        minimumSize: Size(double.maxFinite, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Şifreyi Sıfırla",
                        style: ProjectTextStyles().white_w500_s15,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.grey.shade600,
                          size: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            "Giriş Sayfasına Git",
                            style: ProjectTextStyles().grey,
                          ),
                        )
                      ],
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
