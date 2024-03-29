import 'package:custom_design_system/custom_design_system.dart';
import 'package:flutter/material.dart';

class DsFormDialog extends StatelessWidget {
  const DsFormDialog({
    super.key,
    required this.title,
    required this.globalKey,
    required this.inputs,
    this.submit,
    this.isLoading = false,
    this.action = 'Create',
    this.backgroundColor,
  });

  final String title;
  final GlobalKey<FormState> globalKey;
  final List<Widget> inputs;
  final VoidCallback? submit;
  final bool isLoading;
  final String action;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      surfaceTintColor: backgroundColor,
      title: Text(title),
      content: SizedBox(
        width: 500.0,
        child: Form(
          key: globalKey,
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => inputs[index],
            separatorBuilder: (context, index) => const SizedBox(
              height: DSSpacing.md,
            ),
            itemCount: inputs.length,
          ),
        ),
      ),
      actions: <Widget>[
        DsFilledButton(
          label: 'Cancel',
          onPressed: () {
            Navigator.of(context).pop();
          },
          variant: FilledButtonVariant.error,
        ),
        DsFilledButton(
          label: action,
          onPressed: submit,
          isLoading: isLoading,
        )
      ],
    );
  }
}
