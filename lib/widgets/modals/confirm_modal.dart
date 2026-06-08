import 'package:flutter/material.dart';
import 'package:harmony_tube/core/services/app_logger.dart';
import 'package:harmony_tube/widgets/app_text_theme.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

final textButtonStyle = TextStyle();
final borderShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(8),
);

class ConfirmModal {
  String? message;
  final void Function(BuildContext context) onConfirm;
  final BuildContext context;
  Widget? top;
  Widget? bottom;

  ConfirmModal({
    this.message,
    required this.onConfirm,
    required this.context,
    this.top,
    this.bottom,
  });

  void closeModal() {
    appLogger.d('ConfirmModal: action canceled');
  }

  open() {
    return WoltModalSheet.show(
      modalTypeBuilder: (context) => WoltModalType.dialog(),
      context: context,
      pageListBuilder: (context) {
        return [
          SliverWoltModalSheetPage(
            mainContentSliversBuilder: (context) => [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    spacing: 16,
                    children: [
                      message!.isNotEmpty
                          ? AppTextTheme(message!, style: textButtonStyle)
                          : SizedBox(),
                      bottom ?? SizedBox(),
                      ConfirmButtonRow(
                        cancelHandler: null,
                        confirmHandler: onConfirm,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ];
      },
    );
  }
}

class ConfirmButtonRow extends StatefulWidget {
  final void Function()? cancelHandler;
  final void Function(BuildContext context) confirmHandler;

  const ConfirmButtonRow({
    super.key,
    required this.confirmHandler,
    this.cancelHandler,
  });

  @override
  State<StatefulWidget> createState() => ConfirmButtonRowState();
}

class ConfirmButtonRowState extends State<ConfirmButtonRow> {
  bool isPending = false;

  @override
  Widget build(BuildContext context) {
    void handleCancel() {
      try {
        if (widget.cancelHandler != null) {
          widget.cancelHandler!();
        }
      } catch (e, st) {
        appLogger.e('ConfirmModal cancel handler failed',
            error: e, stackTrace: st);
      } finally {
        Navigator.of(context).pop();
      }
    }

    void handleConfirm() {
      try {
        widget.confirmHandler(context);
        Navigator.of(context).pop();
      } catch (e, st) {
        appLogger.e('ConfirmModal confirm handler failed',
            error: e, stackTrace: st);
      }
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: handleCancel,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
              shadowColor: Colors.transparent,
              shape: borderShape,
            ),
            child: AppTextTheme("Annuler", style: textButtonStyle),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              shape: borderShape,
            ),
            onPressed: handleConfirm,
            child: Text("Confirmer", style: textButtonStyle),
          ),
        ],
      ),
    );
  }
}
