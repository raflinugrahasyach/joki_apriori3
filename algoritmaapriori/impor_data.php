<?php
// Memulai session jika belum ada
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
// Menampilkan semua error untuk memudahkan debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Langkah 1: Koneksi ke Database
$config = include 'koneksi.php';
$koneksi = mysqli_connect($config['host'], $config['username'], $config['password'], $config['dbname']);
if (!$koneksi) {
    die("<h3>Koneksi Database Gagal!</h3><p>Error: " . mysqli_connect_error() . "</p>");
}

// Langkah 2: Persiapan File CSV
$file_csv = 'data_ulos.csv'; 
if (!file_exists($file_csv)) {
    die("<h3>Error: File `" . htmlspecialchars($file_csv) . "` tidak ditemukan!</h3>");
}

$transactions = [];
$header = true;
echo "Membaca file " . htmlspecialchars($file_csv) . "...<br>";

// Langkah 3: Membaca dan Mengelompokkan Data dari CSV
if (($handle = fopen($file_csv, "r")) !== FALSE) {
    while (($data = fgetcsv($handle, 2000, ";")) !== FALSE) {
        if ($header || empty($data) || empty(trim($data[0]))) {
            $header = false;
            continue;
        }

        // Mengambil semua kolom yang relevan dari CSV
        $tanggal_str       = trim($data[1]);
        $nama_produk       = trim($data[2]);
        $harga_satuan      = (int)preg_replace("/[^0-9]/", "", trim($data[4])); // Ambil harga satuan
        $jumlah_terjual    = (int)trim($data[5]);
        $total_harga       = (int)preg_replace("/[^0-9]/", "", trim($data[6]));
        $nama_pembeli      = trim($data[7]);
        $kota_tujuan       = trim($data[8]);
        $metode_pembayaran = trim($data[9]);

        try {
            $tanggal_obj = DateTime::createFromFormat('d/m/Y', $tanggal_str);
            if ($tanggal_obj === false) { $tanggal_obj = new DateTime($tanggal_str); }
            $tanggal_db = $tanggal_obj->format('Y-m-d');
        } catch (Exception $e) { continue; }

        // Kunci pengelompokan: Tanggal + Nama Pembeli
        $grouping_key = $tanggal_db . '|' . $nama_pembeli;

        // Mengelompokkan data berdasarkan kunci baru
        if (!isset($transactions[$grouping_key])) {
            $transactions[$grouping_key] = [
                'tanggal'           => $tanggal_db,
                'produk'            => [],
                'harga'             => $harga_satuan, // Ambil harga dari item pertama
                'jumlah_terjual'    => 0,
                'total_harga'       => 0,
                'nama_pembeli'      => $nama_pembeli,
                'kota_tujuan'       => $kota_tujuan,
                'metode_pembayaran' => $metode_pembayaran
            ];
        }

        // Menambahkan produk dan menjumlahkan nilai ke dalam transaksi yang sama
        $transactions[$grouping_key]['produk'][] = $nama_produk;
        $transactions[$grouping_key]['jumlah_terjual'] += $jumlah_terjual;
        $transactions[$grouping_key]['total_harga'] += $total_harga;
    }
    fclose($handle);
}

echo "Pembacaan file selesai. " . count($transactions) . " transaksi unik ditemukan.<br><br>";
echo "<h3>Memulai Proses Impor...</h3>";

// Langkah 4: Memasukkan Data yang Sudah Dikelompokkan ke Database
mysqli_query($koneksi, "TRUNCATE TABLE transaksi");
echo "Info: Tabel `transaksi` telah dikosongkan.<br>";

$sukses_count = 0;
foreach ($transactions as $details) {
    $produk_unik = array_unique($details['produk']);
    $produk_string = implode(',', $produk_unik);
    
    // Mengamankan data sebelum query
    $tanggal_escaped         = mysqli_real_escape_string($koneksi, $details['tanggal']);
    $produk_escaped          = mysqli_real_escape_string($koneksi, $produk_string);
    $harga_escaped           = (int)$details['harga']; // Gunakan harga yang sudah disimpan
    $jumlah_terjual_escaped  = (int)$details['jumlah_terjual'];
    $total_harga_escaped     = (int)$details['total_harga'];
    $pembeli_escaped         = mysqli_real_escape_string($koneksi, $details['nama_pembeli']);
    $kota_escaped            = mysqli_real_escape_string($koneksi, $details['kota_tujuan']);
    $metode_escaped          = mysqli_real_escape_string($koneksi, $details['metode_pembayaran']);

    // =======================================================================================
    // PERBAIKAN: Sekarang kolom harga diisi dengan nilai dari data
    // =======================================================================================
    $query = "INSERT INTO transaksi (transaction_date, produk, harga, jumlah_terjual, total_harga, nama_pembeli, kota_tujuan, metode_pembayaran) 
              VALUES ('$tanggal_escaped', '$produk_escaped', '$harga_escaped', $jumlah_terjual_escaped, $total_harga_escaped, '$pembeli_escaped', '$kota_escaped', '$metode_escaped')";
    
    if (mysqli_query($koneksi, $query)) {
        $sukses_count++;
    } else {
        echo "Gagal mengimpor Transaksi - Error: ".mysqli_error($koneksi)."<br>";
    }
}

echo "<h3>Proses Impor Selesai!</h3>";
echo "<strong>" . $sukses_count . " Transaksi Berhasil Diimpor.</strong><br>";
echo "<hr>";
echo "<a href='index.php?menu=data_transaksi' class='btn btn-primary'>Lihat Hasil di Halaman Data Penjualan</a>";

mysqli_close($koneksi);
?>
