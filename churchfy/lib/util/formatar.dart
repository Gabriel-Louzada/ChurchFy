import 'package:flutter/services.dart';

class CustomDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    // Remove caracteres não numéricos
    text = text.replaceAll(RegExp(r'[^0-9]'), '');

    if (text.length > 8) {
      text = text.substring(0, 8);
    }

    StringBuffer newText = StringBuffer();
    if (text.length >= 2) {
      newText.write(text.substring(0, 2) + '/');
    } else if (text.length >= 1) {
      newText.write(text.substring(0, 1));
    }
    if (text.length >= 4) {
      newText.write(text.substring(2, 4) + '/');
    } else if (text.length > 2) {
      newText.write(text.substring(2));
    }
    if (text.length > 4) {
      newText.write(text.substring(4));
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class CustomPhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove tudo que não for número
    String newText = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Adiciona a formatação conforme o número de caracteres
    if (newText.length <= 2) {
      newText = '(${newText.substring(0, newText.length)})';
    } else if (newText.length <= 7) {
      newText =
          '(${newText.substring(0, 2)}) ${newText.substring(2, newText.length)}';
    } else if (newText.length <= 11) {
      newText =
          '(${newText.substring(0, 2)}) ${newText.substring(2, 7)}-${newText.substring(7, newText.length)}';
    } else {
      newText =
          '(${newText.substring(0, 2)}) ${newText.substring(2, 7)}-${newText.substring(7, 11)}';
    }

    // Garantir que não haja erro de índice
    if (newText.length > 15) {
      newText = newText.substring(
          0, 15); // Limita o tamanho máximo do texto formatado
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
