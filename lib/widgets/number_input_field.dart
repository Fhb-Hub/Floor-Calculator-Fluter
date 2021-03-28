import 'package:flutter/material.dart';

class NumberInputField extends StatelessWidget {
  final String label;
  final Function(String) onSaved;

  const NumberInputField({
    Key key,
    this.label,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (label) {
        if (label.isEmpty) {
          return "O campo é obrigatório.";
        } else if (label.contains('.')) {
          if (label.startsWith('.')) {
            return "Digite um número antes do caracter '.'";
          } else if (label.endsWith('.')) {
            return "Digite um número depois do caracter '.'";
          } else if (label.length - label.replaceAll('.', '').length > 1) {
            return "O campo não pode conter mais de um ponto.";
          }
        } else {
          if (label.startsWith('0')) {
            return "O campo não pode ser nulo.";
          }
        }
        return null;
      },
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}
