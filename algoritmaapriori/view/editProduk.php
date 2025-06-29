<?php
// Menyertakan file class database dan membuat koneksi yang benar
include_once "../database.php";
$db_object = new database();

if (isset($_POST['idx'])) {
    $id = $_POST['idx'];
    
    // Mengambil data menggunakan method db_query yang benar
    $query = $db_object->db_query("SELECT * FROM `tbl_produk` WHERE id_produk='$id' ");
    $row = $db_object->db_fetch_array($query);

    // Form ini sekarang sudah benar dan tidak akan error lagi
    echo '<input type="hidden" name="id_produk" value="' . $row['id_produk'] . '">';
    echo '<div class="form-group">
            <label for="edit_jenis_ulos">Jenis Ulos</label>
            <input type="text" name="jenis_ulos" value="' . htmlspecialchars($row['jenis_ulos']) . '" id="edit_jenis_ulos" class="form-control" required />
          </div>';
    echo '<div class="form-group">
            <label for="edit_harga">Harga</label>
            <input type="number" name="harga" value="' . htmlspecialchars($row['harga']) . '" id="edit_harga" class="form-control">
          </div>';
    // Input file dan gambar sudah tidak ada sesuai permintaan.
}
?>