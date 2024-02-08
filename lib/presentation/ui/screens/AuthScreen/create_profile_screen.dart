import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopy_bay/controller/create_profile_controller.dart';
import 'package:shopy_bay/presentation/ui/screens/ShopScreen/bottom_navScreen.dart';
import 'package:shopy_bay/presentation/ui/utility/assets_path.dart';
import 'package:shopy_bay/presentation/ui/widgets/home/shopybay_text.dart';
import '../../utility/app_colors.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _shippingAddressController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // const Spacer(),
                    const SizedBox(height: 60),
                    Lottie.asset(
                      AssetsPath.applogo,
                      width: 100,
                    ),
                    shopyBayText(context),
                    const SizedBox(height: 20),
                    Text(
                      'Complete Profile',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Get started with us by completing your profile',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: _firstNameController,
                      decoration: const InputDecoration(
                        hintText: 'First Name',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _mobileNumberController,
                      decoration: const InputDecoration(
                        hintText: 'Mobile Number',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your mobile number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _cityController,
                      decoration: const InputDecoration(
                        hintText: 'City',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your city';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _shippingAddressController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        hintText: 'Shipping Address',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your shipping address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    GetBuilder<CreateProfileController>(
                      builder: (createProfileController) {
                        return SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: Visibility(
                            visible: createProfileController.isLoading == false,
                            replacement: Center(
                              child: const CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ),
                            ),
                            child: ElevatedButton(
                              onPressed: () async{
                                if(_formKey.currentState!.validate()){
                                  final response= await createProfileController.createProfile(
                                    _firstNameController.text,
                                    _mobileNumberController.text,
                                    _cityController.text,
                                    _shippingAddressController.text,
                                  );
                                  if(response){
                                    Get.offAll(()=>const BottomNavScreen());
                                  }
                                  else{
                                    Get.showSnackbar(GetSnackBar(
                                      message: Get.find<CreateProfileController>().errorMessage,
                                      snackPosition: SnackPosition.BOTTOM,
                                    ));
                                  }
                                }
                                //Get.to(const BottomNavScreen());
                              },
                              child: const Text('Next'),
                            ),
                          ),
                        );
                      }
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
