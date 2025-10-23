import 'package:flutter/material.dart';
import 'package:harmony_tube/widgets/app_text_theme.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class ConfirmModal {
  final String message;
  final Future<void> onConfirm;
  BuildContext context;
  Widget? top;
  Widget? bottom;

  ConfirmModal({
    required this.message,
    required this.onConfirm,
    required this.context,
    this.top,
    this.bottom,
  });

  void closeModal() {
    Navigator.of(context).pop();
  }

  show() {
    return WoltModalSheet.show(
      modalTypeBuilder: (context) => WoltModalType.dialog(),
      context: context,
      pageListBuilder: (context) {
        return [
          SliverWoltModalSheetPage(
            mainContentSliversBuilder: (context) => [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    top ?? SizedBox(),
                    AppTextTheme(message),
                    bottom ?? SizedBox(),
                  ]
                ),
              ),
            ],),

        ];
      },
    );
  }
}
