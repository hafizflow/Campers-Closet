import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BackLoginView extends GetView {
  const BackLoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BackLoginView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BackLoginView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
