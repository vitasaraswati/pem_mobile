void tampilkanRiwayat(List<Map<String, dynamic>> riwayat) {
  print('===============================:');
  print('=== Riwayat Perhitungan BMI ===:');
  print('===============================:');
  for (var data in riwayat) {
    print(
      'Tinggi: ${data['tinggi']} cm, Berat: ${data['berat']} kg, BMI: ${data['bmi'].toStringAsFixed(2)}, Kategori: ${data['kategori']}'
    );
  }
}
