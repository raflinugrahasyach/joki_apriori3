<?php
// Pastikan session berjalan
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Cek hak akses, menggunakan session ID yang benar
if (!isset($_SESSION['apriori_id'])) {
    header("location:index.php?menu=forbidden");
    exit(); // Penting untuk menghentikan eksekusi setelah redirect
}

include_once "database.php";
include_once "fungsi.php";

// Buat objek database
$db_object = new database();

// =======================================================================
// MULAI BLOK KODE BARU UNTUK FUNGSI HAPUS RIWAYAT
// =======================================================================
if (isset($_GET['hapus_log'])) {
    // Ambil ID proses yang akan dihapus dan pastikan itu adalah angka
    $id_process_to_delete = intval($_GET['hapus_log']);
    
    // Pastikan ID valid untuk mencegah error
    if ($id_process_to_delete > 0) {
        // Hapus semua data terkait dari tabel-tabel itemset dan confidence
        // Ini penting untuk menjaga kebersihan dan integritas database
        $db_object->delete_record("itemset1", ["id_process" => $id_process_to_delete]);
        $db_object->delete_record("itemset2", ["id_process" => $id_process_to_delete]);
        $db_object->delete_record("itemset3", ["id_process" => $id_process_to_delete]);
        $db_object->delete_record("confidence", ["id_process" => $id_process_to_delete]);
        
        // Terakhir, hapus log proses utamanya
        $db_object->delete_record("process_log", ["id" => $id_process_to_delete]);
        
        // Alihkan kembali ke halaman hasil dengan pesan sukses
        header("location: index.php?menu=hasil&pesan_sukses=Riwayat proses berhasil dihapus.");
        exit(); // Hentikan eksekusi skrip setelah redirect
    }
}
// =======================================================================
// SELESAI BLOK KODE BARU
// =======================================================================

?>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800"><i class="fas fa-fw fa-coins"></i> Data Hasil</h1>
</div>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-danger"><i class="fa fa-table"></i> Daftar Data Hasil</h6>
    </div>

    <div class="card-body">
        <?php
        // Menampilkan pesan sukses jika ada (misalnya setelah menghapus)
        if (isset($_GET['pesan_sukses'])) {
            display_success($_GET['pesan_sukses']);
        }
        
        // Mengambil semua riwayat proses dari database, diurutkan dari yang terbaru
        $sql = "SELECT * FROM process_log ORDER BY id DESC";
        $query = $db_object->db_query($sql);
        ?>
        
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead class="bg-danger text-white">
                    <tr align="center">
                        <th>No</th>
                        <th>Mulai Tanggal</th>
                        <th>Sampai Tanggal</th>
                        <th>Min. Support</th>
                        <th>Min. Confidence</th>
                        <th width="15%">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $no = 1;
                    while ($row = $db_object->db_fetch_array($query)) {
                        ?>
                        <tr>
                            <td class='text-center'><?= $no++ ?></td>
                            <td class='text-center'><?= format_date2($row['start_date']) ?></td>
                            <td class='text-center'><?= format_date2($row['end_date']) ?></td>
                            <td class='text-center'><?= $row['min_support'] ?></td>
                            <td class='text-center'><?= $row['min_confidence'] ?></td>
                            <td class='text-center'>
                                <div class='btn-group' role='group'>
                                    <a href="?menu=view_rule&id_process=<?= $row['id'] ?>" class="btn btn-success btn-sm" data-toggle="tooltip" title="Lihat Detail">
                                        <i class="fa fa-eye"></i>
                                    </a>
                                    <!-- ======================================================================= -->
                                    <!-- TOMBOL HAPUS BARU DENGAN KONFIRMASI JAVASCRIPT -->
                                    <!-- ======================================================================= -->
                                    <a href="?menu=hasil&hapus_log=<?= $row['id'] ?>" class="btn btn-danger btn-sm" 
                                       onclick="return confirm('Apakah Anda yakin ingin menghapus riwayat proses ini? Semua data terkait (itemset & confidence) juga akan dihapus permanen.')" 
                                       data-toggle="tooltip" title="Hapus Riwayat">
                                        <i class="fa fa-trash"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>
                    <?php
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
