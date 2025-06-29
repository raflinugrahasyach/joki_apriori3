<?php
if (session_status() == PHP_SESSION_NONE) { session_start(); }
if (!isset($_SESSION['apriori_id'])) { header("location:index.php?menu=forbidden"); exit(); }

include_once "database.php";
include_once "fungsi.php";
$db_object = new database();

// Pastikan ID transaksi ada dan valid
if(!isset($_GET['id']) || intval($_GET['id']) == 0){
    echo "<h1>ID Transaksi tidak valid.</h1><a href='?menu=data_transaksi'>Kembali</a>";
    exit();
}
$id_transaksi = intval($_GET['id']);

// LOGIKA UPDATE DATA
if (isset($_POST['update'])) {
    $id = intval($_POST['id']);
    $produk_array = isset($_POST['produk']) ? $_POST['produk'] : [];
    
    if(!empty($produk_array)){
        // Kumpulkan semua data dari form
        $set_update = [
            'transaction_date' => $_POST['transaction_date'],
            'produk' => implode(",", $produk_array),
            'nama_pembeli' => $_POST['nama_pembeli'], 
            'kota_tujuan' => $_POST['kota_tujuan'],
            'metode_pembayaran' => $_POST['metode_pembayaran']
        ];
        $where = ['id' => $id];
        
        $db_object->update_record('transaksi', $set_update, $where);
        echo "<script> location.replace('?menu=data_transaksi&pesan_sukses=Data berhasil diupdate'); </script>";
        exit();
    }
}

// Mengambil data untuk ditampilkan di form
$query_edit = $db_object->db_query("SELECT * FROM transaksi WHERE id=$id_transaksi");
if($db_object->db_num_rows($query_edit) == 0){
    echo "<h1>Data tidak ditemukan.</h1><a href='?menu=data_transaksi'>Kembali</a>";
    exit();
}
$data = $db_object->db_fetch_array($query_edit);
$produk_terpilih = explode(",", $data['produk']);
?>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800"><i class="fas fa-fw fa-edit"></i> Edit Data Penjualan Ulos</h1>
    <a href="?menu=data_transaksi" class="btn btn-secondary"><i class="fa fa-arrow-circle-left"></i> Kembali</a>
</div>

<div class="card shadow mb-4">
    <div class="card-header py-3"><h6 class="m-0 font-weight-bold text-danger">Form Edit Data</h6></div>
    <form method="post" action="">
        <div class="card-body">
            <input type="hidden" name="id" value="<?= $data['id'] ?>">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group"><label class="font-weight-bold">Tanggal Transaksi</label><input type="date" name="transaction_date" value="<?= $data['transaction_date'] ?>" class="form-control" required /></div>
                    <div class="form-group"><label class="font-weight-bold">Nama Pembeli</label><input type="text" name="nama_pembeli" value="<?= htmlspecialchars($data['nama_pembeli']) ?>" class="form-control" required></div>
                    <div class="form-group"><label class="font-weight-bold">Kota Tujuan</label><input type="text" name="kota_tujuan" value="<?= htmlspecialchars($data['kota_tujuan']) ?>" class="form-control" required></div>
                    <div class="form-group"><label class="font-weight-bold">Metode Pembayaran</label><select name="metode_pembayaran" class="form-control" required><option value="COD" <?= ($data['metode_pembayaran'] == 'COD') ? 'selected' : ''; ?>>COD</option><option value="Transfer Bank" <?= ($data['metode_pembayaran'] == 'Transfer Bank') ? 'selected' : ''; ?>>Transfer Bank</option><option value="E-Wallet" <?= ($data['metode_pembayaran'] == 'E-Wallet') ? 'selected' : ''; ?>>E-Wallet</option><option value="Kartu Kredit" <?= ($data['metode_pembayaran'] == 'Kartu Kredit') ? 'selected' : ''; ?>>Kartu Kredit</option></select></div>
                </div>
                 <div class="col-md-6">
                    <div class="form-group"><label class="font-weight-bold">Produk Ulos</label><select name="produk[]" id="multiple" multiple required>
                        <?php
                        $produk_query = $db_object->db_query("SELECT jenis_ulos FROM `tbl_produk` ORDER BY jenis_ulos ASC");
                        while ($p_row = $db_object->db_fetch_array($produk_query)) {
                            $selected = in_array($p_row['jenis_ulos'], $produk_terpilih) ? "selected" : "";
                            echo '<option value="' . htmlspecialchars($p_row['jenis_ulos']) . '" ' . $selected . '>' . htmlspecialchars($p_row['jenis_ulos']) . '</option>';
                        }
                        ?>
                    </select></div>
                </div>
            </div>
        </div>
        <div class="card-footer text-right"><button name="update" type="submit" class="btn btn-success"><i class="fa fa-save"></i> Update Data</button></div>
    </form>
</div>