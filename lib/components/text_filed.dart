import 'package:flutter/services.dart';
import 'package:quiz_u/library.dart';

Widget myTextFiled({
  void Function(String)? onChanged,
  void Function(String?)? onSaved, //
  @required String? labelText, //
  String? validatorText,
  @required TextInputType? keyboardType,
  String? Function(String?)? validator,
  void Function()? fun,
  Widget? suffixIcon,
  bool obscureText = false,
  bool isvalidator = true,
  String? hintText,
  String? initialValue,
  TextEditingController? controller,
  bool readOnly = false,
  double? height = 61,
  int maxLines = 1,
   List<TextInputFormatter>? inputFormatters
}) =>
    SizedBox(
      height: height,
      child: TextFormField(
        //  maxLength: 10,
        
        onFieldSubmitted: onSaved ,
       // onSaved: onSaved,
         inputFormatters: inputFormatters,
        initialValue: initialValue,
        maxLines: maxLines,
        textAlign: TextAlign.start,
        onTap: fun,
        autofocus: false,
        readOnly: readOnly,
        controller: controller,
        validator: isvalidator
            ? (value) => value!.isEmpty ? validatorText : null
            : validator,
        keyboardType: keyboardType,
        onChanged: onChanged,
        obscureText: obscureText,
        cursorColor: AppBrand.mainColor,
        decoration: InputDecoration(
          filled: true,
          
          fillColor: Colors.white,
          //suffixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(width: .4, color: AppBrand.mainColor)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(width: .4, color: AppBrand.mainColor)),
          disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(width: .4, color: AppBrand.mainColor)),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(width: .4, color: AppBrand.mainColor)),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(width: .4, color: AppBrand.mainColor)),
          labelText: labelText,
          hintText: hintText,
        ),
      ),
    );
