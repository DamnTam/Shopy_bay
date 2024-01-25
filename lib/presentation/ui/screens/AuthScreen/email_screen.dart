import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopy_bay/controller/sentEmailOtpController.dart';
import 'package:shopy_bay/presentation/ui/utility/assets_path.dart';
import '../../widgets/shopybay_text.dart';
import 'otp_screen.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RegExp _emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Lottie.asset(
                    AssetsPath.applogo,
                    width: 100,
                  ),
                ),
                shopyBayText(context,),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Welcome to ShopyBay',
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  'Please enter your email address',
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleSmall,
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'Please enter email';
                    }
                    else if (!_emailRegex.hasMatch(value.trim())) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<SentEmailOtpController>(
                  builder: (controller){
                    return Visibility(
                      visible: controller.isLoading==false,
                      replacement: const Center(child: CircularProgressIndicator()),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: ()=> sentEmailOtpPressed(controller),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text('Continue'),
                          ),
                        ),
                      ),
                    );

                  }
                ),
                const SizedBox(
                  height: 20,
                ),
                const Spacer()
              ],
            ),
          ),
        ));
  }


  Future<void> sentEmailOtpPressed(SentEmailOtpController controller) async {
    if (_formKey.currentState!.validate()) {
      final response= await controller.sentEmailOtp(_emailController.text.trim());
      if(response){
        Get.to(()=> OtpScreen(email: _emailController.text.trim()));
      }
      else{
        Get.showSnackbar(
            GetSnackBar(
              title: 'Error',
              message: controller.errorMessage,
              duration: const Duration(seconds: 2),
            )
        );
      }
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
  }
}