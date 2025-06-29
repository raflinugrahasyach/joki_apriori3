<?php

/* * Proses mining function
 * VERSI PROFESIONAL: Bug pada looping dan logika kombinasi telah diperbaiki.
 */

function reset_temporary($db_object)
{
    $db_object->db_query("TRUNCATE itemset1");
    $db_object->db_query("TRUNCATE itemset2");
    $db_object->db_query("TRUNCATE itemset3");
    $db_object->db_query("TRUNCATE confidence");
}

function reset_hitungan($db_object, $id_process)
{
    $condition = array("id_process" => $id_process);
    $db_object->delete_record("itemset1", $condition);
    $db_object->delete_record("itemset2", $condition);
    $db_object->delete_record("itemset3", $condition);
    $db_object->delete_record("confidence", $condition);
}

function mining_process($db_object, $min_support, $min_confidence, $start_date, $end_date, $id_process)
{
    // 1. Mengambil semua data transaksi ke dalam array untuk pemrosesan cepat
    $sql_trans = "SELECT * FROM transaksi WHERE transaction_date BETWEEN '$start_date' AND '$end_date'";
    $result_trans = $db_object->db_query($sql_trans);
    $dataTransaksi = [];
    $item_list = [];
    $jumlah_transaksi = $db_object->db_num_rows($result_trans);

    if ($jumlah_transaksi == 0) {
        return false;
    }

    while ($myrow = $db_object->db_fetch_array($result_trans)) {
        $dataTransaksi[] = $myrow;
        $produk = explode(",", $myrow['produk']);
        foreach ($produk as $value_produk) {
            $value_produk = trim($value_produk);
            if (!empty($value_produk) && !in_array($value_produk, $item_list)) {
                $item_list[] = $value_produk;
            }
        }
    }

    // 2. Membangun Itemset 1
    echo "<div class='card shadow mb-4'><div class='card-header py-3'><h6 class='m-0 font-weight-bold text-danger'><i class='fa fa-table'></i> Itemset 1</h6></div><div class='card-body'><table class='table table-bordered' width='100%' cellspacing='0'><thead class='bg-danger text-white'><tr align='center'><th>No</th><th>Item</th><th>Jumlah</th><th>Support</th><th>Keterangan</th></tr></thead>";
    
    $itemset1_lolos = [];
    $jumlahItemset1_lolos = [];
    $supportItemset1_lolos = [];
    $valueIn_itemset1 = [];
    
    foreach ($item_list as $i => $item) {
        $jumlah = jumlah_itemset1($dataTransaksi, $item);
        $support = ($jumlah / $jumlah_transaksi) * 100;
        $lolos = ($support >= $min_support) ? 1 : 0;
        
        $valueIn_itemset1[] = "('" . mysqli_real_escape_string($db_object->koneksi, $item) . "','$jumlah','$support','$lolos','$id_process')";
        
        if ($lolos) {
            $itemset1_lolos[] = $item;
            $jumlahItemset1_lolos[] = $jumlah;
            $supportItemset1_lolos[] = $support;
        }
        echo "<tr><td class='text-center'>" . ($i + 1) . "</td><td>" . $item . "</td><td class='text-center'>" . $jumlah . "</td><td class='text-center'>" . number_format($support, 2) . "%</td><td class='text-center'>" . ($lolos ? "<span class='badge badge-success'>Lolos</span>" : "<span class='badge badge-danger'>Tidak Lolos</span>") . "</td></tr>";
    }
    echo "</table></div></div>";

    if (!empty($valueIn_itemset1)) {
        $sql_insert_itemset1 = "INSERT INTO itemset1 (atribut, jumlah, support, lolos, id_process) VALUES " . implode(",", $valueIn_itemset1);
        $db_object->db_query($sql_insert_itemset1);
    }
    
    // 3. Membangun Itemset 2
    echo "<div class='card shadow mb-4'><div class='card-header py-3'><h6 class='m-0 font-weight-bold text-danger'><i class='fa fa-table'></i> Itemset 2</h6></div><div class='card-body'><table class='table table-bordered' width='100%' cellspacing='0'><thead class='bg-danger text-white'><tr align='center'><th>No</th><th>Item 1</th><th>Item 2</th><th>Jumlah</th><th>Support</th><th>Keterangan</th></tr></thead>";
    
    $itemset2_lolos_var1 = [];
    $itemset2_lolos_var2 = [];
    $valueIn_itemset2 = [];
    $no = 1;

    // PERBAIKAN: Menggunakan loop 'for' yang benar dan efisien, bukan 'while' yang buggy.
    for ($i = 0; $i < count($itemset1_lolos); $i++) {
        for ($j = $i + 1; $j < count($itemset1_lolos); $j++) {
            $item1 = $itemset1_lolos[$i];
            $item2 = $itemset1_lolos[$j];
            
            $jumlah = jumlah_itemset2($dataTransaksi, $item1, $item2);
            $support = ($jumlah / $jumlah_transaksi) * 100;
            $lolos = ($support >= $min_support) ? 1 : 0;
            
            $valueIn_itemset2[] = "('" . mysqli_real_escape_string($db_object->koneksi, $item1) . "','" . mysqli_real_escape_string($db_object->koneksi, $item2) . "','$jumlah','$support','$lolos','$id_process')";
            
            if ($lolos) {
                $itemset2_lolos_var1[] = $item1;
                $itemset2_lolos_var2[] = $item2;
            }
            
            echo "<tr><td class='text-center'>".$no++."</td><td>".$item1."</td><td>".$item2."</td><td class='text-center'>".$jumlah."</td><td class='text-center'>".number_format($support, 2)."%</td><td class='text-center'>" . ($lolos ? "<span class='badge badge-success'>Lolos</span>" : "<span class='badge badge-danger'>Tidak Lolos</span>") . "</td></tr>";
        }
    }
    echo "</table></div></div>";
    
    if (!empty($valueIn_itemset2)) {
        $sql_insert_itemset2 = "INSERT INTO itemset2 (atribut1, atribut2, jumlah, support, lolos, id_process) VALUES " . implode(",", $valueIn_itemset2);
        $db_object->db_query($sql_insert_itemset2);
    }

    // 4. Membangun Itemset 3
    echo "<div class='card shadow mb-4'><div class='card-header py-3'><h6 class='m-0 font-weight-bold text-danger'><i class='fa fa-table'></i> Itemset 3</h6></div><div class='card-body'><table class='table table-bordered' width='100%' cellspacing='0'><thead class='bg-danger text-white'><tr align='center'><th>No</th><th>Item 1</th><th>Item 2</th><th>Item 3</th><th>Jumlah</th><th>Support</th><th>Keterangan</th></tr></thead>";
    
    $valueIn_itemset3 = [];
    $no = 1;
    
    // PERBAIKAN: Logika kandidat itemset 3 yang lebih sederhana dan benar
    $kandidat_itemset3 = [];
    for ($i = 0; $i < count($itemset2_lolos_var1); $i++) {
        for ($j = $i + 1; $j < count($itemset2_lolos_var1); $j++) {
            $itemA = [$itemset2_lolos_var1[$i], $itemset2_lolos_var2[$i]];
            $itemB = [$itemset2_lolos_var1[$j], $itemset2_lolos_var2[$j]];
            
            // Gabungkan dan cari item unik
            $gabungan = array_unique(array_merge($itemA, $itemB));
            
            if (count($gabungan) == 3) {
                sort($gabungan);
                if (!in_array($gabungan, $kandidat_itemset3)) {
                    $kandidat_itemset3[] = $gabungan;
                    $item1 = $gabungan[0];
                    $item2 = $gabungan[1];
                    $item3 = $gabungan[2];
                    
                    $jumlah = jumlah_itemset3($dataTransaksi, $item1, $item2, $item3);
                    $support = ($jumlah / $jumlah_transaksi) * 100;
                    $lolos = ($support >= $min_support) ? 1 : 0;

                    $valueIn_itemset3[] = "('" . mysqli_real_escape_string($db_object->koneksi, $item1) . "','" . mysqli_real_escape_string($db_object->koneksi, $item2) . "','" . mysqli_real_escape_string($db_object->koneksi, $item3) . "','$jumlah','$support','$lolos','$id_process')";
                    
                    echo "<tr><td class='text-center'>".$no++."</td><td>".$item1."</td><td>".$item2."</td><td>".$item3."</td><td class='text-center'>".$jumlah."</td><td class='text-center'>".number_format($support, 2)."%</td><td class='text-center'>" . ($lolos ? "<span class='badge badge-success'>Lolos</span>" : "<span class='badge badge-danger'>Tidak Lolos</span>") . "</td></tr>";
                }
            }
        }
    }
    echo "</table></div></div>";
    
    if (!empty($valueIn_itemset3)) {
        $sql_insert_itemset3 = "INSERT INTO itemset3(atribut1, atribut2, atribut3, jumlah, support, lolos, id_process) VALUES " . implode(",", $valueIn_itemset3);
        $db_object->db_query($sql_insert_itemset3);
    }


    // 5. Menghitung Confidence
    $confidence_from_itemset = 0;
    
    // Dari Itemset 3
    $sql_3 = "SELECT * FROM itemset3 WHERE lolos = 1 AND id_process = " . $id_process;
    $res_3 = $db_object->db_query($sql_3);
    if ($db_object->db_num_rows($res_3) > 0) {
        $confidence_from_itemset = 3;
        while ($row_3 = $db_object->db_fetch_array($res_3)) {
            $items = [$row_3['atribut1'], $row_3['atribut2'], $row_3['atribut3']];
            
            // Generate rules like {A, B} => {C}
            for ($i = 0; $i < count($items); $i++) {
                $antecedent = [];
                for ($j = 0; $j < count($items); $j++) {
                    if ($i != $j) $antecedent[] = $items[$j];
                }
                $consequent = $items[$i];
                hitung_confidence($db_object, $row_3['support'], $min_confidence, $antecedent, [$consequent], $id_process, $dataTransaksi, $jumlah_transaksi, 3);
            }
        }
    }
    
    // Dari Itemset 2
    $sql_2 = "SELECT * FROM itemset2 WHERE lolos = 1 AND id_process = " . $id_process;
    $res_2 = $db_object->db_query($sql_2);
    if ($db_object->db_num_rows($res_2) > 0) {
        if ($confidence_from_itemset == 0) $confidence_from_itemset = 2;
        while ($row_2 = $db_object->db_fetch_array($res_2)) {
            hitung_confidence($db_object, $row_2['support'], $min_confidence, [$row_2['atribut1']], [$row_2['atribut2']], $id_process, $dataTransaksi, $jumlah_transaksi, 2);
            hitung_confidence($db_object, $row_2['support'], $min_confidence, [$row_2['atribut2']], [$row_2['atribut1']], $id_process, $dataTransaksi, $jumlah_transaksi, 2);
        }
    }

    return $confidence_from_itemset > 0;
}

// PERBAIKAN: Fungsi Hitung Confidence yang lebih generik
function hitung_confidence($db_object, $support_xUy, $min_confidence, $antecedent, $consequent, $id_process, $dataTransaksi, $jumlah_transaksi, $from_itemset)
{
    $kombinasi1 = implode(" , ", $antecedent);
    $kombinasi2 = implode(" , ", $consequent);
    
    // Hitung support X (antecedent)
    $jumlah_antecedent = (count($antecedent) == 1)
        ? jumlah_itemset1($dataTransaksi, $antecedent[0])
        : jumlah_itemset2($dataTransaksi, $antecedent[0], $antecedent[1]);
    
    if ($jumlah_antecedent == 0) return; // Mencegah pembagian dengan nol
    
    $support_x = ($jumlah_antecedent / $jumlah_transaksi) * 100;
    
    if ($support_x == 0) return; // Mencegah pembagian dengan nol

    $confidence = ($support_xUy / $support_x) * 100;
    $lolos = ($confidence >= $min_confidence) ? 1 : 0;
    
    // Hitung Uji Lift
    $jumlah_consequent = jumlah_itemset1($dataTransaksi, $consequent[0]);
    $support_y = ($jumlah_consequent / $jumlah_transaksi);
    $lift_ratio = ($support_xUy / 100) / (($support_x / 100) * $support_y);

    $korelasi_rule = "Tidak ada korelasi";
    if ($lift_ratio > 1) {
        $korelasi_rule = "Korelasi Positif";
    } elseif ($lift_ratio < 1) {
        $korelasi_rule = "Korelasi Negatif";
    }

    $db_object->insert_record("confidence", [
        "kombinasi1" => $kombinasi1,
        "kombinasi2" => $kombinasi2,
        "support_xUy" => $support_xUy,
        "support_x" => $support_x,
        "confidence" => $confidence,
        "lolos" => $lolos,
        "min_confidence" => $min_confidence,
        "nilai_uji_lift" => $lift_ratio,
        "korelasi_rule" => $korelasi_rule,
        "id_process" => $id_process,
        "from_itemset" => $from_itemset
    ]);
}

// Fungsi bantu untuk menghitung kemunculan item
function jumlah_itemset1($transaksi_list, $produk)
{
    $count = 0;
    foreach ($transaksi_list as $data) {
        $items = explode(",", $data['produk']);
        $items = array_map('trim', $items);
        if (in_array($produk, $items)) {
            $count++;
        }
    }
    return $count;
}

function jumlah_itemset2($transaksi_list, $variasi1, $variasi2)
{
    $count = 0;
    foreach ($transaksi_list as $data) {
        $items = explode(",", $data['produk']);
        $items = array_map('trim', $items);
        if (in_array($variasi1, $items) && in_array($variasi2, $items)) {
            $count++;
        }
    }
    return $count;
}

function jumlah_itemset3($transaksi_list, $variasi1, $variasi2, $variasi3)
{
    $count = 0;
    foreach ($transaksi_list as $data) {
        $items = explode(",", $data['produk']);
        $items = array_map('trim', $items);
        if (in_array($variasi1, $items) && in_array($variasi2, $items) && in_array($variasi3, $items)) {
            $count++;
        }
    }
    return $count;
}

?>
