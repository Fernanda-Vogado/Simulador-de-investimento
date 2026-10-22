import 'package:flutter/material.dart';

/// Campo de texto numérico reutilizável, com validação.
/// Aceita vírgula ou ponto como separador decimal.
class CampoNumerico extends StatelessWidget {
  final String rotulo;
  final TextEditingController controller;

  const CampoNumerico({
    super.key,
    required this.rotulo,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: rotulo,
          border: const OutlineInputBorder(),
        ),
        validator: (v) {
          if (v == null || double.tryParse(v.replaceAll(',', '.')) == null) {
            return 'Digite um número válido';
          }
          return null;
        },
      ),
    );
  }
}
