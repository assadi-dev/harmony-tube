import 'package:flutter/material.dart';

Widget TextFieldStyled(
  BuildContext context,
  FocusNode focusNode,
  GlobalKey<FormState> formKey,
  String labelText,
  String? hintText,
  TextEditingController controller,
    String? Function(String?)? validator
) {
  final Color secondaryColor = Theme.of(context).colorScheme.primaryContainer;
  final Color primaryColor = Theme.of(context).colorScheme.primary;

  return TextFormField(
    controller: controller,
    style: TextStyle(color: primaryColor, fontSize: 12),
    focusNode: focusNode,
    decoration: InputDecoration(
      filled: true,
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.focused)) {
          return primaryColor.withValues(alpha: 0.1);
        }
        return Colors.transparent;
      }),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: secondaryColor),
      ),
      labelText: labelText,
      hintText: hintText,
      hintStyle: TextStyle(color: primaryColor.withValues(alpha: 0.5)),
    ),
    validator: validator,
  );
}

Widget MultiTextFieldStyled(
  BuildContext context,
  FocusNode focusNode,
  GlobalKey<FormState> formKey,
  String labelText,
  String? hintText,
  TextEditingController controller,
  int? minLines,
  int? maxLines,
  String? Function(String?)? validator,
) {
  final Color secondaryColor = Theme.of(context).colorScheme.primaryContainer;
  final Color primaryColor = Theme.of(context).colorScheme.primary;

  return TextFormField(
    keyboardType: TextInputType.multiline,
    minLines: minLines ?? 1,
    maxLines: maxLines,
    controller: controller,
    style: TextStyle(color: primaryColor, fontSize: 12),
    focusNode: focusNode,
    decoration: InputDecoration(
      filled: true,
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.focused)) {
          return primaryColor.withValues(alpha: 0.1);
        }
        return Colors.transparent;
      }),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: secondaryColor),
      ),
      labelText: labelText,
      hintText: hintText,
      hintStyle: TextStyle(color: primaryColor.withValues(alpha: 0.5)),
    ),
    validator: validator,
  );
}
