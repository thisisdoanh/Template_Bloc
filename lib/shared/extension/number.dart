import 'dart:math';

extension StringToNumberExtension on String {
  int? toInt() => int.tryParse(this);
}

extension IntRandomExtension on int {
  String getRandomString() {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final rnd = Random();
    return String.fromCharCodes(
      Iterable.generate(
        this,
        (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
      ),
    );
  }
}

extension NumberExtension on num {
  String fromKBToText({int fractionDigit = 1, String? prefix}) {
    final units = ['KB', 'MB', 'GB', 'TB'];
    double value = toDouble();
    int unitIndex = 0;
    while (value >= 500 && unitIndex < units.length - 1) {
      value /= 1024;
      unitIndex++;
    }
    final unit = prefix != null
        ? '$prefix${units[unitIndex]}'
        : units[unitIndex];
    return '${value.toStringAsFixed(fractionDigit)} $unit';
  }

  String fromBytesToText({int fractionDigit = 1, String? prefix}) {
    final units = ['B', 'KB', 'MB', 'GB', 'TB'];
    double value = toDouble();
    int unitIndex = 0;
    while (value >= 500 && unitIndex < units.length - 1) {
      value /= 1024;
      unitIndex++;
    }
    final unit = prefix != null
        ? '$prefix${units[unitIndex]}'
        : units[unitIndex];
    return '${value.toStringAsFixed(fractionDigit)} $unit';
  }

  MapEntry<double, String> fromBytesToMapValueUnit({String? prefix}) {
    final units = ['B', 'KB', 'MB', 'GB', 'TB'];
    double value = toDouble();
    int unitIndex = 0;
    while (value >= 500 && unitIndex < units.length - 1) {
      value /= 1024;
      unitIndex++;
    }
    final unit = prefix != null
        ? '$prefix${units[unitIndex]}'
        : units[unitIndex];
    return MapEntry(value, unit);
  }
}

// extension NumberExtension on double {
//   String toText({int fractionDigit = 1, String? prefix}) {
//     String formattedNumber = toStringAsFixed(fractionDigit);
//
//     if (formattedNumber.contains('.') && formattedNumber.endsWith('0')) {
//       formattedNumber = formattedNumber.replaceAll(RegExp(r'0*$'), '');
//     }
//
//     if (formattedNumber.endsWith('.')) {
//       formattedNumber =
//           formattedNumber.substring(0, formattedNumber.length - 1);
//     }
//
//     if (prefix == null) {
//       return formattedNumber;
//     }
//     if (this > 1) {
//       return '$prefix.other'.tr(args: [formattedNumber]);
//     }
//     return '$prefix.one'.tr(args: [formattedNumber]);
//   }
//
//   String toTextFormat() {
//     const locale = 'vi_VN';
//     final formatter = NumberFormat.decimalPattern(locale);
//     return formatter.format(this).replaceAll('.', ',');
//   }
//
//   String toTextDecimalENFormat() {
//     const locale = 'en_EN';
//     final formatter = NumberFormat.decimalPattern(locale);
//     return formatter.format(this);
//   }
// }

extension DoubleNullableExtention on double? {
  double roundDouble(int fractionDigit) {
    return double.parse(this?.toStringAsFixed(fractionDigit) ?? '0.0');
  }

  double toMillion() {
    return (this ?? 0) / 1000000;
  }
}

extension ListUtils<T> on List<T> {
  num sumBy(num Function(T element) f) {
    num sum = 0;
    for (final item in this) {
      sum += f(item);
    }
    return sum;
  }
}

// extension IntExtension on int {
//   String toText({String? prefix}) {
//     final String number = toString();
//     if (prefix == null) {
//       return number;
//     }
//     if (this > 1) {
//       return '$prefix.other'.tr(args: [number]);
//     }
//     return '$prefix.one'.tr(args: [number]);
//   }
// }
