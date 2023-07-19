import 'package:flutter/material.dart';

import 'custom_signup_form_field.dart';

class NameTextFields extends StatelessWidget {
  const NameTextFields({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.firstNameOnChanged,
    required this.lastNameOnChanged,
    required this.isAvailableFirstName,
    required this.isAvailableLastName,
    required this.isLoaded,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  final firstNameOnChanged;
  final lastNameOnChanged;

  final isAvailableFirstName;
  final isAvailableLastName;

  final bool isLoaded;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 3),
          height: 30,
          child: Row(children: [
            Text(
              "Username [required]",
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ]),
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomSignupFormField(
                  label: "First Name",
                  useObsecureText: true,
                  hintText: "First Name",
                  controller: firstNameController,
                  onChanged: firstNameOnChanged,
                  isAvailable: isAvailableFirstName,
                  isLoaded: isLoaded),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 3,
              child: CustomSignupFormField(
                  label: "Last Name",
                  useObsecureText: true,
                  hintText: "Last Name",
                  controller: lastNameController,
                  onChanged: lastNameOnChanged,
                  isAvailable: isAvailableLastName,
                  isLoaded: isLoaded),
            ),
          ],
        ),
      ],
    );
  }
}
