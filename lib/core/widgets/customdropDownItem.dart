import 'package:flutter/material.dart';

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
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<T>(
          value: _selectedValue,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.black, width: 2.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.black, width: 2.5),
            ),
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