import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  CustomTextFormField(
      {super.key,
      this.title,
      this.titleColor,
      this.titleSize,
      this.textController,
      this.cursorColor,
      this.initialValue,
      this.keybordType,
      this.obscureText = false,
      this.onChanged,
      this.onFieldSubmitted,
      this.onSaved,
      this.showCursor,
      this.textStyle,
      this.validator,
      this.label,
      this.labelText,
      this.labelStyle,
      this.hintText,
      this.prefixWidget,
      this.isFilledColor = true,
      this.fillColor,
      this.borderRadius,
      this.borderSideColor,
      this.borderSideWidth,
      this.contentPadding,
      this.hintColor,
      this.textColor,
      this.textSize,
      this.boxShadow,
      this.isPassword = false,
      this.aroundPadding = EdgeInsets.zero,
      this.textAlign = TextAlign.start,
      this.maxline,
      this.onTap,
      this.onEditingComplete,
      this.textInputFormatte,
      this.enabled = true,
      this.readOnly = false,
      this.isSearch = false,
      this.hintStyle,
      this.suffixWidget, 
     });
  //title
  final String? title;
  final Color? titleColor;
  final double? titleSize;
  // textForm
  final TextEditingController? textController;
  final Color? cursorColor;
  final bool? showCursor;
  final String? initialValue;
  final TextInputType? keybordType;
  bool obscureText;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final TextStyle? textStyle;
  final String? Function(String?)? validator;
  // dicoration
  final Widget? label;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final Widget? prefixWidget;
  final bool? isFilledColor;
  final Color? fillColor;
  final double? borderRadius;
  final Color? borderSideColor;
  final double? borderSideWidth;
  final EdgeInsetsGeometry? contentPadding;
  final double? textSize;
  final Color? textColor;
  final Color? hintColor;
  final List<BoxShadow>? boxShadow;
  final bool isPassword;
  EdgeInsetsGeometry? aroundPadding;
  TextAlign textAlign;
  final int? maxline;
  final void Function()? onTap;
  void Function()? onEditingComplete;
  final List<TextInputFormatter>? textInputFormatte;
  final bool? enabled;
  final bool readOnly;
  final bool isSearch;
  final Widget? suffixWidget;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container( 
      
      // to fix label error
      padding: widget.aroundPadding,
      // clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.0),
        boxShadow: widget.boxShadow,
      ),
      child: TextFormField(
        enabled: widget.enabled,
        readOnly: widget.readOnly,
        inputFormatters: widget.textInputFormatte,
        onEditingComplete: widget.onEditingComplete,
        onTap: widget.onTap,
        maxLines: widget.maxline ?? 1,
        controller: widget.textController,
        cursorColor: widget.cursorColor ?? AppColors.primary(context),
        showCursor: widget.showCursor,
        initialValue: widget.initialValue,
        keyboardType: widget.keybordType,
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
        onSaved: widget.onSaved,
        style: widget.textStyle ??
             TextStyle(color: widget.textColor ?? AppColors.textNormalColor(context), fontSize: 20.0),
        // to controll of align of text in text form field
        textAlign: widget.textAlign,
        validator: widget.validator,
        decoration: InputDecoration(
          contentPadding: widget.contentPadding ??
              const EdgeInsets.symmetric(vertical: 15.0),
          label: widget.label,
          labelText: widget.labelText,
          labelStyle: widget.labelStyle ??
               TextStyle(fontSize: 20.0, color: AppColors.normalTextGrey(context)),
          hintText: widget.hintText,
          hintStyle: widget.hintStyle ??
              TextStyle(
                  color: widget.hintColor ?? AppColors.normalTextGrey(context),
                  fontSize: 20.0),
          prefixIcon: widget.prefixWidget , 
          suffixIcon: widget.isPassword
              ? InkWell(
                  onTap: () {
                    setState(() {
                      widget.obscureText = !widget.obscureText;
                    });
                  },
                  child: Icon(
                    widget.obscureText == false
                        ? Icons.remove_red_eye_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.normalTextGrey(context),
                    size: 25.0,
                  ),
                )
              : widget.suffixWidget  , 
                  
          filled: true,
          fillColor: widget.fillColor ?? AppColors.backgroundColorMode(context),
          border: InputBorder.none,
          enabledBorder: widget.isSearch == true
              ? searchBorder
              : customBorder(color: widget.borderSideColor),
          errorBorder: widget.isSearch == true
              ? searchBorder
              : customErrorBorder(color: widget.borderSideColor),
          focusedBorder: widget.isSearch == true
              ? searchBorder
              : customBorder(color: widget.borderSideColor),
          focusedErrorBorder: widget.isSearch == true
              ? searchBorder
              : customErrorBorder(color: widget.borderSideColor),
        ),
      ),
    );
  }

  InputBorder customBorder({Color? color}) => UnderlineInputBorder(
        borderSide: BorderSide(
            color: color ?? AppColors.normalTextGrey(context)), // Change the color here
      );
  InputBorder customErrorBorder({Color? color}) => UnderlineInputBorder(
        borderSide: BorderSide(color: color ?? Colors.red),
      );
  final InputBorder searchBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      borderSide: BorderSide.none);
}
