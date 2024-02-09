import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopy_bay/controller/create_profile_controller.dart';
import 'package:shopy_bay/data/models/create_profile_parameter_model.dart';
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
  TextEditingController _customerNameController = TextEditingController();
  TextEditingController _customerAddressController = TextEditingController();
  TextEditingController _CustomerCityController = TextEditingController();
  TextEditingController _customerStateController = TextEditingController();
  TextEditingController _customerPostCodeController = TextEditingController();
  TextEditingController _customerCountryController = TextEditingController();
  TextEditingController _customerPhoneNumberController = TextEditingController();
  TextEditingController _customerFaxController = TextEditingController();
  TextEditingController _shipNameController = TextEditingController();
  TextEditingController _shipAddressController = TextEditingController();
  TextEditingController _shipCityController = TextEditingController();
  TextEditingController _shipStateController = TextEditingController();
  TextEditingController _shipPostCodeController = TextEditingController();
  TextEditingController _shipCountryController = TextEditingController();
  TextEditingController _shipPhoneNumberController = TextEditingController();
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
                      controller: _customerNameController,
                      decoration: const InputDecoration(
                        hintText: 'Customer Name',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _customerAddressController,
                      decoration: const InputDecoration(
                        hintText: 'Customer Address',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _CustomerCityController,
                      decoration: const InputDecoration(
                        hintText: 'Customer City',
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
                      controller: _customerStateController,
                      decoration: const InputDecoration(
                        hintText: 'Customer State',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your state';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _customerPostCodeController,
                      decoration: const InputDecoration(
                        hintText: 'Customer Post Code',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your post code';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _customerCountryController,
                      decoration: const InputDecoration(
                        hintText: 'Customer Country',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your country';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _customerPhoneNumberController,
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
                      controller: _customerFaxController,
                      decoration: const InputDecoration(
                        hintText: 'Customer Fax',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your fax';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _shipNameController,
                      decoration: const InputDecoration(
                        hintText: 'Ship Name',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your ship name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _shipAddressController,
                      decoration: const InputDecoration(
                        hintText: 'Ship Address',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your ship address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _shipCityController,
                      decoration: const InputDecoration(
                        hintText: 'Ship City',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your ship city';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _shipStateController,
                      decoration: const InputDecoration(
                        hintText: 'Ship State',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your ship state';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _shipPostCodeController,
                      decoration: const InputDecoration(
                        hintText: 'Ship Post Code',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your ship post code';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _shipCountryController,
                      decoration: const InputDecoration(
                        hintText: 'Ship Country',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your ship country';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _shipPhoneNumberController,
                      decoration: const InputDecoration(
                        hintText: 'Ship Mobile Number',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your ship mobile number';
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
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                final createProfileParameter =
                                    CreateProfileParameter(
                                  CustomerName:
                                      _customerNameController.text.trim(),
                                  CustomerAddress:
                                      _customerAddressController.text.trim(),
                                  CustomerCity:
                                      _CustomerCityController.text.trim(),
                                  CustomerState:
                                      _customerStateController.text.trim(),
                                  CustomerPostCode:
                                      _customerPostCodeController.text.trim(),
                                  CustomerCountry:
                                      _customerCountryController.text.trim(),
                                  CustomerPhone: _customerPhoneNumberController
                                      .text
                                      .trim(),
                                  CustomerFax:
                                      _customerFaxController.text.trim(),
                                  ShippingName: _shipNameController.text.trim(),
                                  ShippingAddress:
                                      _shipAddressController.text.trim(),
                                  ShippingCity: _shipCityController.text.trim(),
                                  ShippingState:
                                      _shipStateController.text.trim(),
                                  ShippingPostCode:
                                      _shipPostCodeController.text.trim(),
                                  ShippingCountry:
                                      _shipCountryController.text.trim(),
                                  ShippingPhone:
                                      _shipPhoneNumberController.text.trim(),
                                );
                                final response = await createProfileController
                                    .createProfile(createProfileParameter);
                                if (response) {
                                  Get.offAll(() => const BottomNavScreen());
                                } else {
                                  Get.showSnackbar(GetSnackBar(
                                    message: Get.find<CreateProfileController>()
                                        .errorMessage,
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
                    }),
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
