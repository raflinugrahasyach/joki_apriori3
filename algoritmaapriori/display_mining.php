<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/highcharts.js"></script>

<?php

// Pastikan fungsi ini hanya dideklarasikan sekali
if (!function_exists('display_process_hasil_mining')) {
    function display_process_hasil_mining($db_object, $id_process)
    {
        // Mengambil data confidence dari itemset 3 untuk tabel
        $sql_conf_3 = "SELECT * FROM confidence WHERE id_process = " . $id_process . " AND from_itemset=3";
        $query_conf_3 = $db_object->db_query($sql_conf_3);

        // Mengambil data confidence dari itemset 2 untuk tabel
        $sql_conf_2 = "SELECT * FROM confidence WHERE id_process = " . $id_process . " AND from_itemset=2";
        $query_conf_2 = $db_object->db_query($sql_conf_2);

        // Menggabungkan SEMUA data confidence yang LOLOS untuk GRAFIK dan TABEL RULE
        $data_confidence_lolos = [];
        $query_lolos = $db_object->db_query("SELECT * FROM confidence WHERE id_process = " . $id_process . " AND lolos = 1");
        while ($row = $db_object->db_fetch_array($query_lolos)) {
            $data_confidence_lolos[] = $row;
        }
?>
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-danger"><i class="fa fa-table"></i> Confidence dari Itemset 3</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" width="100%" cellspacing="0">
                        <thead class="bg-danger text-white">
                            <tr align="center">
                                <th>No</th><th>X => Y</th><th>Support X U Y</th><th>Support X</th><th>Confidence</th><th>Keterangan</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $no = 1; while ($row = $db_object->db_fetch_array($query_conf_3)) { ?>
                            <tr>
                                <td class='text-center'><?= $no++ ?></td>
                                <td><?= htmlspecialchars($row['kombinasi1']) ?> => <?= htmlspecialchars($row['kombinasi2']) ?></td>
                                <td class='text-center'><?= number_format($row['support_xUy'], 2) ?> %</td>
                                <td class='text-center'><?= number_format($row['support_x'], 2) ?> %</td>
                                <td class='text-center'><?= number_format($row['confidence'], 2) ?> %</td>
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
                <h6 class="m-0 font-weight-bold text-danger"><i class="fa fa-table"></i> Confidence dari Itemset 2</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" width="100%" cellspacing="0">
                        <thead class="bg-danger text-white">
                            <tr align="center">
                                 <th>No</th><th>X => Y</th><th>Support X U Y</th><th>Support X</th><th>Confidence</th><th>Keterangan</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $no = 1; mysqli_data_seek($query_conf_2, 0); while ($row = $db_object->db_fetch_array($query_conf_2)) { ?>
                            <tr>
                                <td class='text-center'><?= $no++ ?></td>
                                <td><?= htmlspecialchars($row['kombinasi1']) ?> => <?= htmlspecialchars($row['kombinasi2']) ?></td>
                                <td class='text-center'><?= number_format($row['support_xUy'], 2) ?> %</td>
                                <td class='text-center'><?= number_format($row['support_x'], 2) ?> %</td>
                                <td class='text-center'><?= number_format($row['confidence'], 2) ?> %</td>
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
                <h6 class="m-0 font-weight-bold text-danger"><i class="fa fa-project-diagram"></i> Rule Asosiasi yang Terbentuk</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" width="100%" cellspacing="0">
                        <thead class="bg-danger text-white">
                            <tr align="center">
                                <th>No</th><th>X => Y</th><th>Confidence</th><th>Nilai Uji Lift</th><th>Korelasi Rule</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            if (empty($data_confidence_lolos)) {
                                echo "<tr><td colspan='5' class='text-center'>Tidak ada rule yang memenuhi syarat.</td></tr>";
                            } else {
                                $no = 1;
                                foreach ($data_confidence_lolos as $val) {
                                    echo "<tr><td class='text-center'>" . $no++ . "</td><td>" . htmlspecialchars($val['kombinasi1']) . " => " . htmlspecialchars($val['kombinasi2']) . "</td><td class='text-center'>" . number_format($val['confidence'], 2) . "%</td><td class='text-center'>" . number_format($val['nilai_uji_lift'], 2) . "</td><td class='text-center'>" . htmlspecialchars($val['korelasi_rule']) . "</td></tr>";
                                }
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-danger"><i class="fa fa-chart-area"></i> Grafik Rule Asosiasi yang Terbentuk</h6>
            </div>
            <div class="card-body">
                <div id="rules" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
            </div>
        </div>
        
        <script type="text/javascript">
            $(function() {
                if (<?php echo count($data_confidence_lolos); ?> > 0) {
                    $('#rules').highcharts({
                        chart: { type: 'column' },
                        title: { text: 'Grafik Rule Asosiasi yang Terbentuk' },
                        xAxis: {
                            categories: [
                                <?php
                                foreach ($data_confidence_lolos as $val) {
                                    echo "'" . addslashes($val['kombinasi1'] . " => " . $val['kombinasi2']) . "',";
                                }
                                ?>
                            ],
                            crosshair: true,
                            labels: { rotation: -45, style: { fontSize: '10px' } }
                        },
                        yAxis: { min: 0, title: { text: 'Nilai' } },
                        tooltip: {
                            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                                         '<td style="padding:0"><b>{point.y:.2f}</b></td></tr>',
                            footerFormat: '</table>',
                            shared: true,
                            useHTML: true
                        },
                        series: [{
                            name: 'Confidence (%)',
                            data: [
                                <?php
                                foreach ($data_confidence_lolos as $val) {
                                    echo number_format($val['confidence'], 2, '.', '') . ",";
                                }
                                ?>
                            ]
                        }, {
                            name: 'Nilai Uji Lift',
                            data: [
                                <?php
                                foreach ($data_confidence_lolos as $val) {
                                    echo number_format($val['nilai_uji_lift'], 2, '.', '') . ",";
                                }
                                ?>
                            ]
                        }]
                    });
                }
            });
        </script>
<?php
    }
}
?>
