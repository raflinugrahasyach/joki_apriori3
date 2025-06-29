<?php
// Langkah 1: Membaca file konfigurasi database
// File koneksi.php Anda mengembalikan sebuah array, jadi kita akan menangkapnya.
$config = include 'koneksi.php';

$host = $config['host'];
$username = $config['username'];
$password = $config['password'];
$dbname = $config['dbname'];

// Langkah 2: Membuat koneksi database secara langsung dan pasti
$koneksi = mysqli_connect($host, $username, $password, $dbname);

// Langkah 3: Memeriksa apakah koneksi berhasil
if (!$koneksi) {
    die("<h3>Koneksi Database Gagal!</h3> <p>Error: " . mysqli_connect_error() . "</p><p>Mohon periksa kembali detail di dalam file `koneksi.php` Anda.</p>");
}

echo "<h3>Memulai Proses Pengisian Data Produk...</h3>";

// Data produk yang akan dimasukkan sesuai permintaan awal Anda
$data_ulos = [
    ["jenis_ulos" => "Ulos Ragi Hotang", "harga" => 600000],
    ["jenis_ulos" => "Ulos Sibolang", "harga" => 1200000],
    ["jenis_ulos" => "Ulos Ragidup", "harga" => 750000],
    ["jenis_ulos" => "Ulos Mangiring", "harga" => 500000],
    ["jenis_ulos" => "Ulos Bintang Maratur", "harga" => 800000]
];

// Kosongkan tabel produk untuk memastikan tidak ada data duplikat
mysqli_query($koneksi, "TRUNCATE TABLE tbl_produk");
echo "Info: Tabel produk lama telah dikosongkan.<br>";

$sukses_count = 0;
$gagal_count = 0;

// Looping untuk memasukkan setiap data ulos ke tabel
foreach ($data_ulos as $ulos) {
    $nama = mysqli_real_escape_string($koneksi, $ulos['jenis_ulos']);
    $harga = mysqli_real_escape_string($koneksi, $ulos['harga']);

    $query = "INSERT INTO tbl_produk (jenis_ulos, harga) VALUES ('$nama', '$harga')";

    if (mysqli_query($koneksi, $query)) {
        echo "Sukses: " . htmlspecialchars($nama) . " berhasil ditambahkan.<br>";
        $sukses_count++;
    } else {
        echo "Gagal: Gagal menambahkan " . htmlspecialchars($nama) . ". Error: " . mysqli_error($koneksi) . "<br>";
        $gagal_count++;
    }
}

echo "<h3>Proses Selesai!</h3>";
echo "<strong>Total Produk Berhasil Ditambahkan: " . $sukses_count . "</strong><br>";
echo "<strong>Total Produk Gagal Ditambahkan: " . $gagal_count . "</strong><br>";
echo "<hr>";
echo "<a href='index.php?menu=produk' class='btn btn-primary'>Kembali ke Halaman Data Kain Ulos</a>";

// Menutup koneksi
mysqli_close($koneksi);

// Anda bisa menghapus file ini (isi_produk.php) setelah berhasil dijalankan
// agar tidak sengaja dijalankan lagi di kemudian hari.
?>