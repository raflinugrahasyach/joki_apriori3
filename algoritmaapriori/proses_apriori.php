<?php
// DISESUAIKAN: Menggunakan session ID Anda yang sudah benar
if (!isset($_SESSION['apriori_id'])) {
    header("location:index.php?menu=forbidden");
}

include_once "database.php";
include_once "fungsi.php";
include_once "mining.php";
include_once "display_mining.php";

//object database class
$db_object = new database();

$pesan_error = $pesan_success = "";
if (isset($_GET['pesan_error'])) {
    $pesan_error = $_GET['pesan_error'];
}
if (isset($_GET['pesan_success'])) {
    $pesan_success = $_GET['pesan_success'];
}

if (isset($_POST['submit'])) {
    $can_process = true;
    if (empty($_POST['min_support']) || empty($_POST['min_confidence'])) {
        $can_process = false;
?>
        <script>
            location.replace("?menu=proses_apriori&pesan_error=Min Support dan Min Confidence harus diisi");
        </script>
    <?php
    }
    if (!is_numeric($_POST['min_support']) || !is_numeric($_POST['min_confidence'])) {
        $can_process = false;
    ?>
        <script>
            location.replace("?menu=proses_apriori&pesan_error=Min Support dan Min Confidence harus diisi angka");
        </script>
<?php
    }

    if ($can_process) {
        $tgl = explode(" - ", $_POST['range_tanggal']);
        $start = format_date($tgl[0]);
        $end = format_date($tgl[1]);

        //insert log process
        $field_value = array(
            "start_date" => $start,
            "end_date" => $end,
            "min_support" => $_POST['min_support'],
            "min_confidence" => $_POST['min_confidence']
        );
        $query = $db_object->insert_record("process_log", $field_value);
        $id_process = $db_object->db_insert_id();

        // RUN MINING PROCESS
        $result = mining_process(
            $db_object,
            $_POST['min_support'],
            $_POST['min_confidence'],
            $start,
            $end,
            $id_process
        );

        if ($result) {
            display_success("Proses mining selesai");
        } else {
            display_error("Gagal mendapatkan aturan asosiasi");
        }

        // TAMPILKAN HASIL
        display_process_hasil_mining($db_object, $id_process);
    }
} else {
    // TAMPILAN AWAL (FORM)
?>
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800"><i class="fas fa-fw fa-sync"></i> Data Proses</h1>
    </div>

    <?php
    if (!empty($pesan_error)) {
        display_error($pesan_error);
    }
    if (!empty($pesan_success)) {
        display_success($pesan_success);
    }
    ?>

    <form method="post" action="">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label>Tanggal Transaksi:</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                        </div>
                        <input type="text" class="form-control pull-right" name="range_tanggal" id="range_tanggal" required="" placeholder="Pilih rentang tanggal">
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label>Min Support:</label>
                    <input name="min_support" type="text" class="form-control" placeholder="Masukkan Nilai Minimum Support">
                </div>
                <div class="form-group">
                    <label>Min Confidence:</label>
                    <input name="min_confidence" type="text" class="form-control" placeholder="Masukkan Nilai Minimum Confidence">
                </div>
                <div class="form-group">
                    <input name="submit" type="submit" value="Proses" class="btn btn-success">
                </div>
            </div>
        </div>
    </form>
<?php
}
?>