import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ResetView extends GetView {
  const ResetView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ResetView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ResetView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
