import 'dart:io';
import 'package:jobsheet_3/faktorial.dart';
import 'package:jobsheet_3/prima.dart';

void main() {
  while (true) {
    print('\n=== Menu Program ===');
    print('1. Hitung Faktorial');
    print('2. Cek Bilangan Prima');
    print('3. Keluar');
    stdout.write('Pilih menu (1-3): ');
    var choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      stdout.write('Masukkan angka: ');
      int n = int.parse(stdin.readLineSync()!);
      print('Faktorial dari $n = ${hitungFaktorial(n)}');
    } else if (choice == 2) {
      stdout.write('Masukkan angka: ');
      int n = int.parse(stdin.readLineSync()!);
      print('$n adalah bilangan ${isPrime(n) ? "Prima" : "Bukan Prima"}');
    } else if (choice == 3) {
      print('Program selesai. Bye!');
      break;
    } else {
      print('Pilihan tidak valid.');
    }
  }
}
