class StringUtils {
  static String toNoPalatals(String? original) {
    String retorno;

    if (original == null) {
      return "";
    }

    retorno = original.toString();

    retorno = retorno.replaceAll("Â ", "A");
    retorno = retorno.replaceAll("Ç", "C");
    retorno = retorno.replaceAll("ç", "c");
    retorno = retorno.replaceAll("É ", "E");
    retorno = retorno.replaceAll("é", "e");
    retorno = retorno.replaceAll("Ê ", "E");
    retorno = retorno.replaceAll("I", "i");
    retorno = retorno.replaceAll("Ô", "O");
    retorno = retorno.replaceAll("Ù", "U");
    retorno = retorno.replaceAll("ù", "u");
    retorno = retorno.replaceAll("á", "a");
    retorno = retorno.replaceAll("Á", "A");
    retorno = retorno.replaceAll("ç", "c");
    retorno = retorno.replaceAll("ã", "a");
    retorno = retorno.replaceAll("ó", "o");
    retorno = retorno.replaceAll("â", "a");
    retorno = retorno.replaceAll("é", "e");
    retorno = retorno.replaceAll("í", "i");
    retorno = retorno.replaceAll("ê", "e");
    retorno = retorno.replaceAll("ô", "o");
    retorno = retorno.replaceAll("ú", "u");
    retorno = retorno.replaceAll("Ó", "O");
    retorno = retorno.replaceAll("õ", "o");
    retorno = retorno.replaceAll("Â", "a");
    retorno = retorno.replaceAll("É", "e");

    return retorno;
  }
}