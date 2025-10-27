import 'package:flutter/material.dart';
import '../helpers/ui_helpers.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final TextInputType keyboardType;

  const SearchBarWidget({
    super.key,
    required this.controller,
    this.onChanged,
    this.hintText,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(UIHelpers.defaultPadding),
      child: TextField(
        controller: controller,
        decoration: UIHelpers.searchInputDecoration.copyWith(
          hintText: hintText,
          
        ),
        keyboardType: keyboardType,
        textInputAction: TextInputAction.search,
        onChanged: onChanged,
      ),
    );
  }
}

