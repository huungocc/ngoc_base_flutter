import 'package:flutter/material.dart';

import '../../res/resources.dart';
import 'widget.dart';

class CustomDialog extends StatelessWidget {
  final Function? onSubmit;
  final String titleSubmit;
  final Image? image;
  final String? content;
  final String? buttonText;

  const CustomDialog({
    Key? key,
    this.onSubmit,
    this.titleSubmit = "title_ok",
    this.image,
    this.content,
    this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            Wrap(children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(11),
                decoration: new BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: const Offset(0.0, 10.0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(margin: EdgeInsets.only(top: 16), child: image),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: CustomTextLabel(
                        content,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        onSubmit?.call();
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20, bottom: 12),
                        child: CustomTextLabel(titleSubmit,
                            fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.base_color),
                      ),
                    )
                  ],
                ),
              ),
            ])
          ],
        ));
  }
}
