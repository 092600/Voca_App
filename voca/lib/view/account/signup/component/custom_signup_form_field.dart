import 'package:flutter/material.dart';

class CustomSignupFormField extends StatelessWidget {
  const CustomSignupFormField({
    super.key,
    this.onChanged,
    required this.label,
    required this.hintText,
    required this.useObsecureText,
    required this.controller,
    required this.isAvailable,
    required this.isLoaded,
  });

  final String label;
  final String hintText;
  final bool useObsecureText;

  final onChanged;

  final bool isLoaded;
  final bool isAvailable;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: TextFormField(
          controller: controller,
          obscureText: useObsecureText ? false : true,
          keyboardType:
              useObsecureText ? TextInputType.emailAddress : TextInputType.text,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: isAvailable ? Colors.black : Colors.red,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.blue,
              ),
            ),
            // errorBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(10),
            //   borderSide: const BorderSide(
            //     color: Colors.red,
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
