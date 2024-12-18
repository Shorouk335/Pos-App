import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class SearchField extends StatefulWidget {
  SearchField({super.key, required this.searchController});
  TextEditingController? searchController;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  bool showClearIcon = false;

  @override
  void initState() {
    super.initState();
    widget.searchController?.addListener(onTextChanged);
  }

  void onTextChanged() {
    setState(() {
      showClearIcon = widget.searchController!.text.isNotEmpty;
    });
  }

  void clearText() {
    setState(() {
      widget.searchController?.clear();
      showClearIcon = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        textController: widget.searchController,
        hintText: "search".tr(),
        prefixWidget: const Icon(
          Icons.search,
        ),
        // suffixIcon: showClearIcon ?
        //  IconButton(
        //   onPressed: clearText ,
          
        //  icon: const Icon(
        //   Icons.clear , color: AppColors.error,
        //  )) :  null
         );
  }
}
