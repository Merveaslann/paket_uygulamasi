import 'package:auto_size_text/auto_size_text.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ButtonStyle ElevatedButtonStyle(){
  return ElevatedButton.styleFrom(
    shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
    primary: Colors.deepPurple,
    onPrimary: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 40),
  );
}

Future<dynamic> customSuccessAlert(BuildContext context, String title) {
  return CoolAlert.show(
    context: context,
    type: CoolAlertType.success,
    autoCloseDuration: const Duration(seconds: 2),
    backgroundColor: const Color.fromARGB(0, 0, 0, 0),
    title: title,
    confirmBtnColor: Colors.deepPurple
  );
}


class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
        required this.borderColor,
        required this.borderRadius,
        required this.buttonSize,
        required this.icon,
        required this.onPressed})
      : super(key: key);

  final double borderRadius;
  final double buttonSize;
  final Color borderColor;
  final Widget icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) => Material(
    borderRadius: borderRadius != null ? BorderRadius.circular(borderRadius) : null,
    color: Colors.transparent,
    clipBehavior: Clip.antiAlias,
    child: Ink(
      width: buttonSize,
      height: buttonSize,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: borderRadius != null
            ? BorderRadius.circular(borderRadius)
            : null,
      ),
      child: IconButton(
        icon: icon,
        splashRadius: buttonSize,
        onPressed: onPressed,
      ),
    ),
  );
}









class CustomButton2Options {
  const CustomButton2Options({
    required this.textStyle,
    required this.elevation,
    required this.height,
    required this.width,
    required this.color,
    required this.borderRadius,
    required this.borderSide,
  });

  final TextStyle textStyle;
  final double elevation;
  final double height;
  final double width;
  final Color color;
  final double borderRadius;
  final BorderSide borderSide;
}

class CustomButton2 extends StatefulWidget {
  const CustomButton2({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.options,
    this.showLoadingIndicator = true,
  }) : super(key: key);

  final String text;
  final Function() onPressed;
  final CustomButton2Options options;
  final bool showLoadingIndicator;

  @override
  State<CustomButton2> createState() => _CustomButton2State();
}

class _CustomButton2State extends State<CustomButton2> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Widget textWidget = loading
        ? Center(
            child: Container(
              width: 23,
              height: 23,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(widget.options.textStyle.color ?? Colors.white),
              ),
            ),
          )
        : AutoSizeText(
          widget.text,
          style: widget.options.textStyle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        );

    final onPressed = widget.showLoadingIndicator
        ? () async {
          if (loading) {
            return;
          }
          setState(() => loading = true);
          try {
            await widget.onPressed();
          } finally {
            if (mounted) {
              setState(() => loading = false);
            }
          }
        }
        : () => widget.onPressed();

    ButtonStyle style = ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(widget.options.borderRadius),
          side: widget.options.borderSide,
        ),
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => widget.options.color),
      elevation: MaterialStateProperty.all<double>(widget.options.elevation),
    );


    return Container(
      height: widget.options.height,
      width: widget.options.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: textWidget,
      ),
    );
  }
}
