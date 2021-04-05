const kRequiredField = 'Campo obrigatório';
const kRequiredBeoforePoint = 'Digite um número antes do caracter ponto (.)';
const kRequiredAfterPoint = 'Digite um número depois do caracter ponto (.)';
const kOnlyOnePoint = 'O campo não pode conter mais de um ponto.';
const kNotNull = 'O campo não pode ser nulo.';
const kOnlyPositive = 'O campo não pode ser negativo';

class ValidatorHelper {
  static String condition(String text) {
    if (text.isEmpty) {
      return kRequiredField;
    } else if (text.contains('-')) {
      return kOnlyPositive;
    } else if (text.length - text.replaceAll('.', '').length > 1) {
      return kOnlyOnePoint;
    } else if (text.contains('.')) {
      if (text.startsWith('.')) {
        return kRequiredBeoforePoint;
      } else if (text.endsWith('.')) {
        return kRequiredAfterPoint;
      }
    } else {
      if (text.startsWith('0')) {
        return kNotNull;
      }
    }
    return null;
  }
}
