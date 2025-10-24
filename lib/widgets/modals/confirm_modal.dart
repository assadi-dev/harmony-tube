import 'package:flutter/material.dart';
import 'package:harmony_tube/widgets/app_text_theme.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

final textButtonStyle = TextStyle();
final borderShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(8),
);


class ConfirmModal {
  final String message;
  final void Function()  onConfirm;
  final BuildContext context;
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
  print("action canceled");
  Navigator.of(context).pop();
  }

  void confirm() {
   try{
     onConfirm();
     Navigator.of(context).pop();
   }catch(e){
     print(e);
   }

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
                    spacing: 16,
                  children: [

                    AppTextTheme(message, style: textButtonStyle,),
                    bottom ?? SizedBox(),
                    ConfirmButtonRow(cancelHandler: closeModal,
                        confirmHandler: confirm)
                  ]
                ),
              ),
            ],),

        ];
      },
    );
  }


}


class ConfirmButtonRow extends StatefulWidget {
  final void Function() cancelHandler;
  final void Function() confirmHandler;

  const ConfirmButtonRow(
      {super.key, required this.confirmHandler, required this.cancelHandler});

  @override
  State<StatefulWidget> createState() => ConfirmButtonRowState();

}

class ConfirmButtonRowState extends State<ConfirmButtonRow> {
  bool isPending = false;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                child: AppTextTheme("Annuler", style: textButtonStyle),
                onPressed:  widget.cancelHandler,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    shape: borderShape)),
            ElevatedButton(child: Text("Confirmer", style: textButtonStyle),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme
                    .of(context)
                    .colorScheme
                    .primary,
                foregroundColor: Theme
                    .of(context)
                    .colorScheme
                    .onPrimary,
                shape: borderShape,

              ),
              onPressed:widget.confirmHandler,),

          ]
      ),);
  }


}