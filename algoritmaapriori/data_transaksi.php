<?php
// Pastikan session berjalan dan cek hak akses
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
if (!isset($_SESSION['apriori_id'])) {
    header("location:index.php?menu=forbidden");
    exit();
}

include_once "database.php";
include_once "fungsi.php";
$db_object = new database();

$pesan_error = "";
$pesan_sukses = "";

// LOGIKA UNTUK MENYIMPAN DATA BARU
if (isset($_POST['simpan'])) {
    $produk_array = isset($_POST['produk']) ? $_POST['produk'] : [];
    if (empty($produk_array)) {
        $pesan_error = "Produk belum dipilih.";
    } else {
        $data_to_insert = [
            'transaction_date' => $_POST['transaction_date'],
            'produk' => implode(",", $produk_array),
            'harga' => preg_replace("/[^0-9]/", "", $_POST['harga']), // Hanya ambil angka
            'jumlah_terjual' => intval($_POST['jumlah_terjual']),
            'total_harga' => preg_replace("/[^0-9]/", "", $_POST['total_harga']), // Hanya ambil angka
            'nama_pembeli' => $_POST['nama_pembeli'],
            'kota_tujuan' => $_POST['kota_tujuan'],
            'metode_pembayaran' => $_POST['metode_pembayaran']
        ];
        $db_object->insert_record("transaksi", $data_to_insert);
        header("location: ?menu=data_transaksi&pesan_sukses=Data Penjualan berhasil ditambahkan.");
        exit();
    }
}

// LOGIKA HAPUS SEMUA DATA
if (isset($_POST['delete_all'])) {
    $db_object->db_query("TRUNCATE transaksi");
    header("location: ?menu=data_transaksi&pesan_sukses=Semua data penjualan berhasil dihapus.");
    exit();
}

// LOGIKA HAPUS SATU DATA
if (isset($_GET['hapus'])) {
    $id_to_delete = intval($_GET['hapus']);
    $db_object->delete_record("transaksi", ['id' => $id_to_delete]);
    header("location: ?menu=data_transaksi&pesan_sukses=Data penjualan berhasil dihapus.");
    exit();
}
?>

<!-- Judul Halaman dan Tombol Tambah Data -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800"><i class="fas fa-fw fa-money-bill-wave"></i> Data Penjualan Ulos</h1>
    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modal_tambah_transaksi">
        <i class="fa fa-plus"></i> Tambah Data
    </button>
</div>

<!-- Modal untuk Tambah Data Penjualan -->
<div class="modal fade" id="modal_tambah_transaksi" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <form method="post" action="">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-fw fa-plus"></i> Tambah Data Penjualan Ulos</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="font-weight-bold">Tanggal Transaksi</label>
                                <input type="date" name="transaction_date" value="<?= date('Y-m-d'); ?>" class="form-control" required />
                            </div>
                            <div class="form-group">
                                <label class="font-weight-bold">Nama Pembeli</label>
                                <input type="text" name="nama_pembeli" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label class="font-weight-bold">Kota Tujuan</label>
                                <input type="text" name="kota_tujuan" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label class="font-weight-bold">Metode Pembayaran</label>
                                <select name="metode_pembayaran" class="form-control" required>
                                    <option value="COD">COD</option>
                                    <option value="Transfer Bank">Transfer Bank</option>
                                    <option value="E-Wallet">E-Wallet</option>
                                    <option value="Kartu Kredit">Kartu Kredit</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="font-weight-bold">Produk Ulos (Bisa pilih lebih dari satu)</label>
                                <select name="produk[]" id="multiple" multiple required>
                                    <?php
                                    $produk_query = $db_object->db_query("SELECT jenis_ulos FROM `tbl_produk` ORDER BY jenis_ulos ASC");
                                    while ($p_row = $db_object->db_fetch_array($produk_query)) {
                                        echo '<option value="' . htmlspecialchars($p_row['jenis_ulos']) . '">' . htmlspecialchars($p_row['jenis_ulos']) . '</option>';
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="font-weight-bold">Harga</label>
                                <input type="text" name="harga" id="harga" class="form-control" onkeyup="formatRupiah(this);" required>
                            </div>
                            <div class="form-group">
                                <label class="font-weight-bold">Jumlah Terjual</label>
                                <input type="number" name="jumlah_terjual" id="jumlah" class="form-control" onkeyup="hitungTotal();" required>
                            </div>
                             <div class="form-group">
                                <label class="font-weight-bold">Total Harga</label>
                                <input type="text" name="total_harga" id="total" class="form-control" onkeyup="formatRupiah(this);" required>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-warning" type="button" data-dismiss="modal"><i class="fas fa-fw fa-times"></i> Batal</button>
                    <button name="simpan" type="submit" class="btn btn-success"><i class="fas fa-fw fa-save"></i> Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Tabel untuk menampilkan data penjualan -->
<div class="card shadow mb-4">
    <div class="card-header py-3 d-sm-flex align-items-center justify-content-between">
        <h6 class="m-0 font-weight-bold text-danger"><i class="fa fa-table"></i> Daftar Data Penjualan</h6>
        <form method="post" onsubmit="return confirm('Apakah Anda yakin ingin menghapus SEMUA data penjualan? Tindakan ini tidak dapat dibatalkan.');">
            <button name="delete_all" type="submit" class="btn btn-danger btn-sm"><i class="fas fa-fw fa-trash"></i> Hapus Semua Data</button>
        </form>
    </div>
    <div class="card-body">
        <?php
        if (!empty($pesan_error)) display_error($pesan_error);
        if (!empty($pesan_sukses) || isset($_GET['pesan_sukses'])) display_success(isset($_GET['pesan_sukses']) ? $_GET['pesan_sukses'] : $pesan_sukses);
        
        $query = $db_object->db_query("SELECT * FROM transaksi ORDER BY id DESC");
        ?>
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead class="bg-info text-white">
                    <tr align="center">
                        <th>No</th>
                        <th>Tanggal</th>
                        <th>Produk</th>
                        <th>Harga</th>
                        <th>Jumlah</th>
                        <th>Total</th>
                        <th>Pembeli</th>
                        <th>Tujuan</th>
                        <th>Pembayaran</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $no = 1;
                    while ($row = $db_object->db_fetch_array($query)) { ?>
                        <tr>
                            <td class='text-center'><?= $no++ ?></td>
                            <td class='text-center'><?= format_date2($row['transaction_date']) ?></td>
                            <td><?= $row['produk'] ?></td>
                            <td class='text-right'><?= price_format($row['harga']) ?></td>
                            <td class='text-center'><?= $row['jumlah_terjual'] ?></td>
                            <td class='text-right'><?= price_format($row['total_harga']) ?></td>
                            <td><?= $row['nama_pembeli'] ?></td>
                            <td><?= $row['kota_tujuan'] ?></td>
                            <td class='text-center'><?= $row['metode_pembayaran'] ?></td>
                            <td class='text-center'>
                                <div class='btn-group' role='group'>
                                    <a href="?menu=edit_transaksi&id=<?= $row['id'] ?>" class="btn btn-warning btn-sm"><i class="fa fa-edit"></i></a>
                                    <a href="?menu=data_transaksi&hapus=<?= $row['id'] ?>" onclick="return confirm('Apakah Anda yakin ingin menghapus data ini?')" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i></a>
                                </div>
                            </td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- JavaScript untuk format Rupiah dan perhitungan otomatis -->
<script>
    function formatRupiah(angka, prefix) {
        var number_string = angka.value.replace(/[^,\d]/g, '').toString(),
            split = number_string.split(','),
            sisa = split[0].length % 3,
            rupiah = split[0].substr(0, sisa),
            ribuan = split[0].substr(sisa).match(/\d{3}/gi);

        if (ribuan) {
            separator = sisa ? '.' : '';
            rupiah += separator + ribuan.join('.');
        }

        rupiah = split[1] != undefined ? rupiah + ',' + split[1] : rupiah;
        angka.value = prefix == undefined ? rupiah : (rupiah ? 'Rp. ' + rupiah : '');
    }

    function hitungTotal() {
        var harga = document.getElementById('harga').value.replace(/[^0-9]/g, '');
        var jumlah = document.getElementById('jumlah').value;
        var total = parseInt(harga) * parseInt(jumlah);

        if (!isNaN(total)) {
            var totalInput = document.getElementById('total');
            totalInput.value = total;
            formatRupiah(totalInput, 'Rp. ');
        }
    }
</script>