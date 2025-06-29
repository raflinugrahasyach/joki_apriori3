<?php
// MENGGUNAKAN SISTEM DATABASE YANG BENAR, BUKAN KONEKSI MANUAL
include_once "database.php";
$db_object = new database();

$pesan = ''; // Inisialisasi variabel pesan

// Logika untuk INPUT data baru
if (isset($_POST['inputProduk'])) {
    $jenis_ulos = $_POST['jenis_ulos'];
    $harga = $_POST['harga'];

    // Data untuk dimasukkan
    $data_to_insert = [
        'jenis_ulos' => $jenis_ulos,
        'harga' => $harga
    ];
    
    // Menggunakan method insert_record dari class database
    $input = $db_object->insert_record('tbl_produk', $data_to_insert);
    
    if ($input) {
        $pesan = '<div class="alert alert-success"><strong>Berhasil!</strong> Menginput data Ulos ' . htmlspecialchars($jenis_ulos) . '.</div>';
    } else {
        $pesan = '<div class="alert alert-danger"><strong>Gagal!</strong> Terjadi kesalahan saat menyimpan.</div>';
    }
} 
// Logika untuk EDIT data
else if (isset($_POST['edit'])) {
    $id_produk = $_POST['id_produk'];
    $jenis_ulos = $_POST['jenis_ulos'];
    $harga = $_POST['harga'];
    
    // Data untuk diupdate
    $data_to_update = [
        'jenis_ulos' => $jenis_ulos,
        'harga' => $harga
    ];
    $where_condition = ['id_produk' => $id_produk];

    // Menggunakan method update_record dari class database
    $edit = $db_object->update_record('tbl_produk', $data_to_update, $where_condition);
    
    if ($edit) {
        $pesan = '<div class="alert alert-success"><strong>Berhasil!</strong> Mengubah data Ulos ' . htmlspecialchars($jenis_ulos) . '.</div>';
    } else {
        $pesan = '<div class="alert alert-danger"><strong>Gagal!</strong> Terjadi kesalahan saat mengubah data.</div>';
    }
}

// Logika untuk menampilkan tombol "Input" berdasarkan level user
if ($_SESSION['apriori_level'] == "1") {
    $insert = '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#inputModal">
      Input Data Ulos
    </button><br><br>';
} else {
    $insert = '';
}
echo $insert;

// Menampilkan pesan sukses/gagal
if (!empty($pesan)) {
    echo $pesan;
}
?>

<div class="card shadow mb-4">
    <div class="card-header py-3 d-sm-flex align-items-center justify-content-between">
        <h6 class="m-0 font-weight-bold text-danger"><i class="fa fa-scroll"></i> Daftar Kain Ulos</h6>
    </div>
    <div class="card-body">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
            <thead class="bg-info text-white">
                <tr>
                    <th>No</th>
                    <th>Jenis Ulos</th>
                    <th>Harga</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                <?php
                // Mengambil data menggunakan method yang benar dari class database
                $query = $db_object->db_query("SELECT * FROM `tbl_produk` ORDER BY id_produk ASC");
                $no = 1;
                while ($row = $db_object->db_fetch_array($query)) {
                ?>
                    <tr>
                        <td><?= $no ?></td>
                        <td><?= htmlspecialchars($row['jenis_ulos']) ?></td>
                        <td><?= "Rp" . number_format($row['harga'], 0, ',', '.') ?></td>
                        <td>
                            <?php if ($_SESSION['apriori_level'] == "1") { ?>
                                <a class="btn btn-success btn-sm" title="Edit" href="#" data-toggle="modal" data-target="#editProdukModal" data-id="<?= $row['id_produk'] ?>">Edit</a>
                                <a onClick="return confirm('Anda Yakin Menghapus Produk Ini?')" href="index.php?hapusProduk=<?= $row['id_produk'] ?>" class="btn btn-danger btn-sm">Delete</a>
                            <?php } ?>
                        </td>
                    </tr>
                <?php
                    $no++;
                }
                ?>
            </tbody>
        </table>
    </div>
</div>

<div class="modal fade" id="inputModal" tabindex="-1" role="dialog" aria-labelledby="inputModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="inputModalLabel">Input Data Ulos</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="" method="POST">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="jenis_ulos">Jenis Ulos Baru</label>
                        <input type="text" name="jenis_ulos" id="jenis_ulos" class="form-control" required />
                    </div>
                    <div class="form-group">
                        <label for="harga">Harga</label>
                        <input type="number" name="harga" id="harga" class="form-control" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" name="inputProduk" class="btn btn-primary">Simpan</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Keluar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="editProdukModal" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title"><i class="fa fa-edit"></i> Update Data Ulos</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form action="" method="post">
                <div class="modal-body">
                    <div class="data-produk"></div>
                </div>
                <div class="modal-footer">
                    <button type="submit" name="edit" class="btn btn-primary">Simpan Perubahan</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Batal</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
    $(document).ready(function() {
        $('#editProdukModal').on('show.bs.modal', function(e) {
            var idx = $(e.relatedTarget).data('id');
            $.ajax({
                type: 'post',
                url: 'view/editProduk.php',
                data: 'idx=' + idx,
                success: function(data) {
                    $('.data-produk').html(data);
                }
            });
        });
    });
</script>