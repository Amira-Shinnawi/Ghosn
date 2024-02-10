import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/style.dart';

class CustomDropdownItem<T> extends StatefulWidget {
  final String labelText;
  final T value;
  final List<DropdownMenuItem<T>> items;
  final String? Function(T?)? validator;
  final void Function(T?)? onChanged;
  final Widget? child;

  const CustomDropdownItem({
    required this.labelText,
    required this.value,
    required this.items,
    this.validator,
    this.onChanged,
    this.child,
  });

  @override
  _CustomDropdownState<T> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdownItem<T>> {
  late T? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style:  Styles.textStyle20Inter,
          ),
        
        const SizedBox(height: 8),
        DropdownButtonFormField<T>(
          value: _selectedValue,
              decoration: InputDecoration(
                filled: true,
                enabledBorder: builtOutLineBorder(),
                focusedBorder: builtOutLineBorder(),
                  contentPadding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
              ),

          validator: widget.validator,
          onChanged: (T? newValue) {
            setState(() {
              _selectedValue = newValue;
              widget.onChanged?.call(newValue);
            });
          },
          items: widget.items,
          dropdownColor: Colors.white,
        ),
        if (widget.child != null) widget.child!,
      ],
    );
  }
}
  OutlineInputBorder builtOutLineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(width: 1),
    );
  }
