# green_alert

Berikut adalah langkah-langkah untuk mengkloning sebuah repository GitHub Flutter dan menjalankannya di emulator:

Prasyarat
Flutter SDK: Pastikan Flutter SDK sudah terinstal di komputer Anda. Jika belum, Anda bisa mengikuti panduan instalasi di dokumentasi Flutter.
Android Studio atau VS Code: Pastikan Anda memiliki Android Studio atau VS Code terinstal. Android Studio biasanya digunakan untuk mengelola emulator Android.
Git: Pastikan Git sudah terinstal di komputer Anda. Anda bisa mengunduh dan menginstalnya dari sini.
Langkah-langkah

1. Clone Repository

Buka terminal atau command prompt.
Navigasi ke direktori di mana Anda ingin mengkloning repository.
Gunakan perintah git clone untuk mengkloning repository:

git clone https://github.com/ibrahimmm999/green_alert.git

2. Navigasi ke Direktori Project

Masuk ke direktori project yang sudah dikloning:
cd repository

3. Install Dependencies

Jalankan perintah berikut untuk menginstal semua dependencies yang diperlukan:
flutter pub get

4. Menjalankan Emulator Android

Jika menggunakan Android Studio:
Buka Android Studio.
Buka AVD Manager (Tools > AVD Manager).
Buat atau pilih emulator yang sudah ada dan jalankan.

Jika menggunakan terminal:
flutter emulators
flutter emulators --launch <emulator_id>
Gantilah <emulator_id> dengan ID emulator yang tersedia.

5. Menjalankan Aplikasi Flutter

Pastikan emulator sudah berjalan.
Kembali ke terminal yang berada di direktori project Flutter, lalu jalankan perintah:
flutter run
