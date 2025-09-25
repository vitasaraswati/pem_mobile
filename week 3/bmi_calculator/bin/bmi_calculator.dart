import 'package:bmi_calculator/bmi_calculation.dart';
import 'package:bmi_calculator/history_feature.dart';

void main() {
  List<Map<String, dynamic>> riwayat = [];

  hitungBMI(170, 65, riwayat);
  hitungBMI(165, 75, riwayat);
  hitungBMI(180, 85, riwayat);

  tampilkanRiwayat(riwayat);
}