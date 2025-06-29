<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/highcharts.js"></script>
<?php

// Pastikan fungsi ini hanya dideklarasikan sekali
if (!function_exists('display_process_hasil_mining')) {
    function display_process_hasil_mining($db_object, $id_process)
    {
        // Query untuk tabel-tabel (Confidence dari Itemset 3 dan 2)
        $sql_conf_3 = "SELECT * FROM confidence WHERE id_process = " . $id_process . " AND from_itemset=3";
        $query_conf_3 = $db_object->db_query($sql_conf_3);

        $sql_conf_2 = "SELECT * FROM confidence WHERE id_process = " . $id_process . " AND from_itemset=2";
        $query_conf_2 = $db_object->db_query($sql_conf_2);

        // Mengambil SEMUA data confidence yang LOLOS untuk GRAFIK dan TABEL RULE
        $data_confidence_lolos = [];
        $query_lolos = $db_object->db_query("SELECT * FROM confidence WHERE id_process = " . $id_process . " AND lolos = 1");
        while ($row = $db_object->db_fetch_array($query_lolos)) {
            $data_confidence_lolos[] = $row;
        }
?>
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-danger"><i class="fa fa-table"></i> Confidence dari itemset 3</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" width="100%" cellspacing="0">
                        <thead class="bg-danger text-white">
                            <tr align="center"><th>No</th><th>X => Y</th><th>Support X U Y</th><th>Support X </th><th>Confidence</th><th>Keterangan</th></tr>
                        </thead>
                        <tbody>
                        <?php $no = 1; while ($row = $db_object->db_fetch_array($query_conf_3)) { ?>
                            <tr>
                                <td class='text-center'><?= $no++ ?></td>
                                <td><?= htmlspecialchars($row['kombinasi1']) ?> => <?= htmlspecialchars($row['kombinasi2']) ?></td>
                                <td class='text-center'><?= price_format($row['support_xUy']) ?>%</td>
                                <td class='text-center'><?= price_format($row['support_x']) ?>%</td>
                                <td class='text-center'><?= price_format($row['confidence']) ?>%</td>
                                <td class='text-center'><?= ($row['lolos'] == 1) ? "<span class='badge badge-success'>Lolos</span>" : "<span class='badge badge-danger'>Tidak Lolos</span>" ?></td>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-danger"><i class="fa fa-table"></i> Confidence dari itemset 2</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" width="100%" cellspacing="0">
                        <thead class="bg-danger text-white">
                            <tr align="center"><th>No</th><th>X => Y</th><th>Support X U Y</th><th>Support X </th><th>Confidence</th><th>Keterangan</th></tr>
                        </thead>
                        <tbody>
                        <?php $no = 1; while ($row = $db_object->db_fetch_array($query_conf_2)) { ?>
                             <tr>
                                <td class='text-center'><?= $no++ ?></td>
                                <td><?= htmlspecialchars($row['kombinasi1']) ?> => <?= htmlspecialchars($row['kombinasi2']) ?></td>
                                <td class='text-center'><?= price_format($row['support_xUy']) ?>%</td>
                                <td class='text-center'><?= price_format($row['support_x']) ?>%</td>
                                <td class='text-center'><?= price_format($row['confidence']) ?>%</td>
                                <td class='text-center'><?= ($row['lolos'] == 1) ? "<span class='badge badge-success'>Lolos</span>" : "<span class='badge badge-danger'>Tidak Lolos</span>" ?></td>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-danger"><i class="fa fa-table"></i> Rule Asosiasi yang terbentuk</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" width="100%" cellspacing="0">
                        <thead class="bg-danger text-white">
                            <tr align="center"><th>No</th><th>X => Y</th><th>Confidence</th><th>Nilai Uji lift</th><th>Korelasi rule</th></tr>
                        </thead>
                        <tbody>
                        <?php
                        if (empty($data_confidence_lolos)) { echo "<tr><td colspan='5' class='text-center'>Tidak ada rule yang memenuhi syarat.</td></tr>"; } 
                        else { $no = 1; foreach ($data_confidence_lolos as $val) { ?>
                            <tr>
                                <td class='text-center'><?= $no++ ?></td>
                                <td><?= htmlspecialchars($val['kombinasi1']) ?> => <?= htmlspecialchars($val['kombinasi2']) ?></td>
                                <td class='text-center'><?= price_format($val['confidence']) ?>%</td>
                                <td class='text-center'><?= price_format($val['nilai_uji_lift']) ?></td>
                                <td class='text-center'><?= htmlspecialchars($val['korelasi_rule']) ?></td>
                            </tr>
                        <?php } } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-danger"><i class="fa fa-chart-area"></i> Grafik Rule Asosiasi yang terbentuk</h6>
            </div>
            <div class="card-body">
                <div id="rules" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
            </div>
        </div>

        <script>
            $(function() {
                var chart;
                $(document).ready(function() {
                    // Hanya gambar chart jika ada data
                    if (<?php echo count($data_confidence_lolos); ?> > 0) {
                        chart = new Highcharts.Chart({
                            chart: { renderTo: 'rules', type: 'line', marginRight: 130, marginBottom: 25 },
                            title: { text: 'Grafik Rule Asosiasi yang terbentuk', x: -20 },
                            subtitle: { text: 'Grafik Multi Line', x: -20 },
                            xAxis: {
                                categories: [<?php
                                    foreach ($data_confidence_lolos as $val) {
                                        echo '"' . addslashes($val['kombinasi1'] . " => " . $val['kombinasi2']) . '",';
                                    }
                                ?>]
                            },
                            yAxis: { title: { text: 'Nilai' }, plotLines: [{ value: 0, width: 1, color: '#808080' }] },
                            tooltip: {
                                formatter: function() { return '<b>' + this.series.name + '</b><br/>' + this.x + ': ' + this.y; }
                            },
                            legend: { layout: 'vertical', align: 'right', verticalAlign: 'top', x: -10, y: 100, borderWidth: 0 },
                            series: [{
                                name: 'Confidence',
                                data: [<?php
                                        foreach ($data_confidence_lolos as $val) {
                                            // PERBAIKAN KRUSIAL: Menggunakan format angka yang benar untuk JavaScript (titik sebagai desimal)
                                            echo number_format((float)$val['confidence'], 2, '.', '') . ', ';
                                        }
                                    ?>]
                            }, {
                                name: 'Nilai Uji lift',
                                data: [<?php
                                        foreach ($data_confidence_lolos as $val) {
                                            // PERBAIKAN KRUSIAL: Menggunakan format angka yang benar untuk JavaScript (titik sebagai desimal)
                                            echo number_format((float)$val['nilai_uji_lift'], 2, '.', '') . ', ';
                                        }
                                    ?>]
                            }]
                        });
                    } else {
                        // Jika tidak ada data, tampilkan pesan
                        $('#rules').html("<div class='alert alert-warning text-center'>Tidak ada data yang memenuhi syarat untuk ditampilkan pada grafik.</div>");
                    }
                });
            });
        </script>
<?php
    }
}
?>
