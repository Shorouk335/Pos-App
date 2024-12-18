import 'dart:async';
import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';


// ignore: must_be_immutable
class CustomAutoCompleteTextField<T> extends StatefulWidget {
  CustomAutoCompleteTextField(
      {super.key,
      this.initialValue,
      this.lable,
      this.showClearIcon = false,
      this.showSufix = false,
      this.showLabel = false,
      this.showRequiredStar = false,
      this.keepSuggestionAftertSelect = false,
      this.removeSelectedItem = false,
      required this.onChanged,
      this.onClear,
      required this.function,
      this.itemAsString,
      this.flex = 1,
      this.hideOnLoading = false,
      this.controller,
      this.enabled = true,
      this.hint,
      this.validator,
      this.padding,
      this.border,
      this.itemBuilder,
      this.itemsFromApi = true,
      this.direction = AxisDirection.down,
      this.showAboveField = false,
      this.emptyWidget,
      this.contentPadding,
      this.validateChosenItem,
      this.prefixIcon,
      this.suffixIcon,
      this.fillColor});

  final Function(T) onChanged;
  final bool showSufix;
  final String? lable;
  final String? hint;
  final String? initialValue;
  final FutureOr<Iterable<T>> Function(String) function;
  VoidCallback? onClear;
  final bool showClearIcon;
  final bool enabled;
  final bool showLabel;
  final bool hideOnLoading;
  final bool showRequiredStar;
  final bool removeSelectedItem;
  final AxisDirection direction;
  final bool keepSuggestionAftertSelect;
  final TextEditingController? controller;
  final String Function(T)? itemAsString;
  final int flex;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? padding;
  final InputBorder? border;
  final bool showAboveField;
  final Widget? emptyWidget;
  final bool itemsFromApi;
  final bool Function(T)? validateChosenItem;
  final EdgeInsetsGeometry? contentPadding;
  final Widget Function(BuildContext, T)? itemBuilder;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  @override
  State<CustomAutoCompleteTextField<T>> createState() =>
      _CutomAutoCompleteTextFeildState<T>();
}

class _CutomAutoCompleteTextFeildState<T>
    extends State<CustomAutoCompleteTextField<T>> {
  late TextEditingController controller;
  final LayerLink _layerLink = LayerLink();
  bool _hasOpenedOverlay = false;
  bool _isLoading = false;
  OverlayEntry? _overlayEntry;
  Timer? _debounce;
  String? selectedItem;
  List<T> suggestions = [];
  @override
  void initState() {
    controller =
        widget.controller ?? TextEditingController(text: widget.initialValue);
    // oldControllerValue = controller.text ;
    super.initState();
  }

  @override
  void dispose() {
    _overlayEntry?.mounted ?? false ? _overlayEntry?.remove() : null;

    _overlayEntry?.mounted ?? false ? _overlayEntry?.dispose() : null;
    _debounce?.cancel();

    super.dispose();
  }
  //  @override
  // void didUpdateWidget(covariant CustomAutoCompleteTextField<T> oldWidget) {
  //   if (oldWidget.controller != widget.controller) {
  //     print("nnnnnnnnnnnnnnnnnn");
  //     print(widget.controller?.text);
  //     oldControllerValue = widget.controller?.text ;
  //     controller = widget.controller ??
  //         TextEditingController(text: widget.initialValue);
  //   }

  //   super.didUpdateWidget(oldWidget);
  // }

  // String? oldControllerValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 10),
      child: IgnorePointer(
          ignoring: !widget.enabled,
          child: WillPopScope(
            onWillPop: () async {
              if (_hasOpenedOverlay) {
                closeOverlay();
                return false;
              } else {
                return true;
              }
            },
            child: CompositedTransformTarget(
                link: _layerLink,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                          key: _key,
                          hintText: widget.hint,
                          maxline: 1,
                          title: widget.lable,
                          prefixWidget: widget.prefixIcon,
                          // suffixIcon: widget.suffixIcon,
                          fillColor: widget.fillColor,
                          labelText: widget.lable,
                        suffixWidget: widget.suffixIcon,
                        contentPadding: widget.contentPadding,
                          // fillColor: AppColors.backgroundColor,
                          // isFilledColor: true,
                          // labelText:
                          //     widget.showLabel ? null : widget.lable,
                          // borderSideColor: Colors.black,

                          // decoration: InputDecoration(
                          //   hintText: widget.hint,
                          //   filled: true,
                          //   fillColor: AppColors.backgroundColor,
                          //   labelText:
                          //       widget.showLabel ? null : widget.lable,
                          //   border: widget.border ??
                          //       OutlineInputBorder(
                          //           borderRadius:
                          //               BorderRadius.circular(10),
                          //           borderSide: BorderSide(
                          //               color: Colors.grey.shade300)),
                          //   enabledBorder: widget.border ??
                          //       OutlineInputBorder(
                          //           borderRadius:
                          //               BorderRadius.circular(10),
                          //           borderSide: BorderSide(
                          //               color: Colors.grey.shade300)),
                          //   suffix: (widget.showClearIcon)
                          //       ? Padding(
                          //           padding:
                          //               const EdgeInsets.only(bottom: 0),
                          //           child: IconButton(
                          //             onPressed: () {
                          //               widget.onClear?.call();
                          //               controller.text = "";
                          //               selectedItem = null;
                          //             },
                          //             icon: const Icon(Icons.clear),
                          //           ),
                          //         )
                          //       : null,
                          //  icon: Icons.arrow_drop_down,
                          //       ? const Row(
                          //           mainAxisSize: MainAxisSize.min,
                          //           children: [
                          //             Icon(
                          //               Icons.keyboard_arrow_down,
                          //               color: AppColors.secoundryColor,
                          //             )
                          //           ],
                          //         )
                          //       : null,
                          //   contentPadding: widget.contentPadding ??
                          //       const EdgeInsets.symmetric(
                          //           horizontal: 10, vertical: 0),
                          // ),
                          textController: controller,
                          onChanged: (s) {
                            if (!_hasOpenedOverlay) openOverlay();

                            updateSuggestions(s);
                          },
                          onTap: () {
                            openOverlay();
                            updateSuggestions(controller.text);
                          },
                          // onEditingComplete: () => closeOverlay(),
                          validator: widget.validator != null
                              ? (value) => widget.validator!(value)
                              : null //
                          )
                    ])),
          )),
    );
  }

  void closeOverlay() {
    if (_hasOpenedOverlay) {
      if (selectedItem != null) {
        controller.text = selectedItem ?? "";
      } else {
        //  controller.text = oldControllerValue ?? "";
        controller.text = "";
      }
      _overlayEntry!.remove();
      setState(() {
        _hasOpenedOverlay = false;
      });
    }
  }

//global key
  final GlobalKey _key = GlobalKey();

  void openOverlay() {
    // oldControllerValue = controller.text ;
    selectedItem = controller.text;
    controller.text = '';
    RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);
    _overlayEntry ??= OverlayEntry(
        builder: (context) => suggestionList(offset, size, context));
    if (_hasOpenedOverlay == false) {
      print("object");
      Overlay.of(context).insert(_overlayEntry!);
      setState(() => _hasOpenedOverlay = true);
    }
  }

  Widget suggestionList(Offset offset, Size size, BuildContext context) {
    final h = MediaQuery.of(context).size.height * 0.3;
    return Positioned(
        left: offset.dx,
        top: offset.dy + size.height,
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, widget.showAboveField ? -h : size.height + 10),
          child: TapRegion(
            behavior: HitTestBehavior.translucent,
            onTapOutside: (event) {
              closeOverlay();
            },
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.zero,
              color: AppColors.backgroundColorMode(context),
              child: SizedBox(
                height: 220,
                child: _isLoading
                    ?  Center(
                        child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(
                          color: AppColors.primary(context),
                        ),
                      ))
                    : suggestions.isEmpty
                        ? widget.emptyWidget ??
                            const Center(
                              child: Text("لا توجد عناصر",
                                  style: TextStyle(fontSize: 20.0)),
                            )
                        : ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: suggestions.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    if (widget.validateChosenItem != null &&
                                        widget.validateChosenItem!(
                                                suggestions[index]) ==
                                            true) return;
                                    if (widget.keepSuggestionAftertSelect ==
                                        false) {
                                      selectedItem = widget.itemAsString
                                              ?.call(suggestions[index]) ??
                                          suggestions[index].toString();
                                      closeOverlay();
                                    }
                                    widget.onChanged(suggestions[index]);
                                  },
                                  child:
                                      //  widget.itemBuilder
                                      //         ?.call(context, suggestions[index]) ??
                                      ListTile(
                                          shape: const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey)),
                                          title: Text(
                                            widget.itemAsString?.call(
                                                    suggestions[index]) ??
                                                suggestions[index].toString(),
                                            style:
                                                const TextStyle(fontSize: 20.0),
                                          )),
                                )),
              ),
            ),
          ),
        ));
  }

  void rebuildOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.markNeedsBuild();
    }
  }

  Future<void> updateSuggestions(String input) async {
    rebuildOverlay();
    setState(() => _isLoading = true);

    if (_debounce != null && _debounce!.isActive) _debounce!.cancel();
    _debounce =
        Timer(Duration(milliseconds: widget.itemsFromApi ? 700 : 0), () async {
      suggestions = (await widget.function.call(input)).toList().toList();
      setState(() {
        _isLoading = false;
      });
      rebuildOverlay();
    });
  }
}
