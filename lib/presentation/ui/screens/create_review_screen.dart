import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Review'),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        )
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 70),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'First Name',
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Last Name',
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              maxLines: 7,
              decoration: const InputDecoration(
                hintText: 'Write your review',
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){}, child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text('Submit'),
              )
              ),
            )],
        ),
      )
    );
  }
}
