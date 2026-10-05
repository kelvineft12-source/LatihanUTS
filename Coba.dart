import 'dart:io';

void main () {
  var jalan = true;
  List waitinglist = [];
  
  while(jalan==true){
    tampilmenu();

    stdout.write("Pilih Menu (1-5): ");
    var pilihan = stdin.readLineSync();
    print("--------------------------");

    switch (pilihan) {
      case '1':
      if (waitinglist.isEmpty) {
        print("Antrean Dalam Kondisi Kosong!!");
      } 
      else {
        for (int i = 0; i < waitinglist.length; i++ ) {
          print("${i + 1}. ${waitinglist[i]}");
        }
      }
      break;

      case '2':
      stdout.write("Masukkan Nomor Plat Mobil: ");
      var nama = stdin.readLineSync();

      
      if (nama != null && nama.isNotEmpty) {
        waitinglist.add(nama.trim());
        print("'$nama' Berhasil Dimasukkin ke dalam List!!");
      }
      else {
        print("Nomor Plat Kendaraan Perlu diIsi!!");
      }
      break;

      case '3':
      if (waitinglist.isNotEmpty) {
        var panggil = waitinglist.removeAt(0);
        print("Memanggil Antrean: '$panggil'");
        print("Sisa yang belum dipanggil: ${waitinglist.length} Kendaraan.");
      }
      else {
        print("Antrean Kosong, Tidak bisa memanggil!!");
      }
      break;

      case '4':
      print("Jumlah yang sedang mengantri saat ini: ${waitinglist.length} Kendaraan.");
      break;

      case '5':
      print("Keluar Dari Program/Aplikasi ini. Terima Kasih!!!");
      jalan = false;
      exit(0);

      default:
      print("Pilihan tidak valid! Masukkan angka 1 sampai 5.");
    }

    print("----------------------------------\n");
  }
}

void tampilmenu() {
  print("=== APLIKASI WAITING LIST POS ===");
  print("1. Lihat Daftar Antrean");
  print("2. Tambah Antrean Baru");
  print("3. Panggil Antrean");
  print("4. Cek Jumlah Total Antrean");
  print("5. Keluar Program");
}
