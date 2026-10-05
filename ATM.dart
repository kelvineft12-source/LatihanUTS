import 'dart:io';

void main() {
  var pinBenar = 1223;
  double saldo = 2000000;
  var jalan = true;

  stdout.write("Masukkan PIN ATM: ");
  String? inputPin = stdin.readLineSync();
  int? PIN = int.tryParse(inputPin ?? '');

  if (PIN != pinBenar) {
    print("PIN tidak Valid!!");
    return;
  }

  print("\nLogin Berhasil!\n");

  while (jalan) {
    tampilmenu();
    print("--------------------------");
    stdout.write("Masukkan Nominal yang ingin anda Setor!: ");
    var pilihan = stdin.readLineSync();
    print("--------------------------");

    switch (pilihan) {
      case '1':
        print("Saldo Anda saat ini: Rp ${saldo.toStringAsFixed(0)}");
        break;

      case '2':
        stdout.write("Masukkan nominal setoran: Rp ");
        var inputSetor = stdin.readLineSync();
        double? nominalSetor = double.tryParse(inputSetor ?? '');

        if (nominalSetor != null && nominalSetor > 0) {
          saldo += nominalSetor;
          print("Berhasil menyetor Rp ${nominalSetor.toStringAsFixed(0)}");
          print("Saldo sekarang: Rp ${saldo.toStringAsFixed(0)}");
        } else {
          print("Nominal setoran tidak valid!");
        }
        break;

    case '3':
      stdout.write("Masukkan nominal penarikan: Rp ");
      var inputTarik = stdin.readLineSync();
      int? nominalTarik = int.tryParse(inputTarik ?? '');

      if (nominalTarik == null || nominalTarik <= 0) {
        print("Nominal penarikan tidak valid!");
        break;
      }

      if (nominalTarik > saldo) {
        print("Tarik tunai gagal! Saldo Anda tidak mencukupi.");
        break;
      }

      if (nominalTarik % 50000 != 0) {
        print("Gagal! Nominal harus kelipatan Rp 50.000.");
        break;
      }

      int lembar100 = nominalTarik ~/ 100000; 
      int sisa = nominalTarik % 100000;
      int lembar50 = sisa ~/ 50000;

      saldo -= nominalTarik;

      print("\n=== PENARIKAN BERHASIL ===");
      print("Nominal Total : Rp $nominalTarik");
      print("Rincian Pecahan:");
      if (lembar100 > 0) {
        print("- Rp 100.000 x $lembar100 Lembar");
      }
      if (lembar50 > 0) {
        print("- Rp  50.000 x $lembar50 Lembar");
      }
      print("Sisa Saldo  : Rp ${saldo.toStringAsFixed(0)}");
      break;

      case '4':
        print("Terima Kasih sudah menggunakan Sistem ATM kami.");
        jalan = false;
        break;

      default:
        print("Pilihan menu tidak valid. Silakan pilih 1 - 4!!!");
    }

    print("");
  }
}

void tampilmenu() {
  print("=== SISTEM ATM ===");
  print("1. Cek Saldo");
  print("2. Masukkan Setoran");
  print("3. Tarik Setoran");
  print("4. Keluar");
}
