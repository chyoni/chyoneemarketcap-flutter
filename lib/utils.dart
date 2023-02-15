class Utils {
  static String getBnFormat(int cap) {
    String baseCap = cap.toString();
    int length = cap.toString().length;
    String result;
    switch (length) {
      case 12:
        result = "${baseCap.substring(0, 3)}.${baseCap.substring(3, 5)} Bn";
        break;
      case 11:
        result = "${baseCap.substring(0, 2)}.${baseCap.substring(2, 4)} Bn";
        break;
      case 10:
        result = "${baseCap.substring(0, 1)}.${baseCap.substring(1, 3)} Bn";
        break;
      case 9:
        result = "0.${baseCap.substring(0, 2)} Bn";
        break;
      default:
        result = baseCap;
    }
    return result;
  }

  static String getPriceFormat(double price) {
    String basePrice = price.toString();
    int dot = basePrice.indexOf(".");
    String result;
    switch (dot) {
      case 5:
        result =
            "${basePrice.substring(0, 2)},${basePrice.substring(2, 5)}${basePrice.substring(dot, dot + 3)}";
        break;
      case 4:
        result =
            "${basePrice.substring(0, 1)},${basePrice.substring(1, 4)}${basePrice.substring(dot, dot + 3)}";
        break;
      case 3:
        result =
            "${basePrice.substring(0, dot)}${basePrice.substring(dot, dot + 3)}";
        break;
      case 2:
        result =
            "${basePrice.substring(0, dot)}${basePrice.substring(dot, dot + 3)}";
        break;
      case 1:
        result =
            "${basePrice.substring(0, dot)}${basePrice.substring(dot, dot + 5)}";
        break;
      default:
        result = basePrice;
    }
    return result;
  }
}
