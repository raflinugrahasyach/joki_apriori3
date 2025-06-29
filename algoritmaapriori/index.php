<?php
// error_reporting(0); // Non-aktifkan error reporting untuk production
// Aktifkan untuk debugging jika perlu
error_reporting(E_ALL);
ini_set('display_errors', 1);

session_start();
include_once 'fungsi.php';
include_once 'database.php';

$db_object = new database();

$menu = '';
if (isset($_GET['menu'])) {
    $menu = $_GET['menu'];
}

if (!isset($_SESSION['apriori_id']) && !in_array($menu, ['tentang', 'not_found', 'forbidden'])) {
    header("location:login.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Association Rule Algoritma Apriori - KemKem Ulos</title>
    
    <!-- CSS LIBRARIES -->
    <link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="assets/css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/daterangepicker.min.css" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/slim-select/1.27.0/slimselect.min.css" rel="stylesheet">
    
    <!-- ======================================================================= -->
    <!-- PERBAIKAN FINAL: Semua JavaScript Library dipindahkan ke HEAD -->
    <!-- Ini memastikan semua 'mesin' siap sebelum konten halaman dimuat -->
    <!-- ======================================================================= -->
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="assets/js/moment.min.js"></script>
    <script src="assets/js/daterangepicker.min.js"></script>
    <script src="assets/js/highcharts.js"></script> <!-- Library Grafik -->
    <script src="assets/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="assets/vendor/datatables/dataTables.bootstrap4.min.js"></script>
    <!-- ======================================================================= -->

</head>
<body id="page-top">
    <div id="wrapper">
        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion" id="accordionSidebar">
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.php">
                <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-scroll"></i></div>
                <div class="sidebar-brand-text mx-3">KemKem Ulos</div>
            </a>
            <hr class="sidebar-divider my-0">
            <li class="nav-item <?= ($menu == '') ? 'active' : '' ?>"><a class="nav-link" href="index.php"><i class="fas fa-fw fa-home"></i><span>Halaman Utama</span></a></li>
            <hr class="sidebar-divider">
            <div class="sidebar-heading">Master Data</div>
            <li class="nav-item <?= ($menu == 'produk') ? 'active' : '' ?>"><a class="nav-link" href="index.php?menu=produk"><i class="fas fa-scroll"></i><span>Data Kain Ulos</span></a></li>
            <li class="nav-item <?= ($menu == 'data_transaksi' || $menu == 'edit_transaksi') ? 'active' : '' ?>"><a class="nav-link" href="index.php?menu=data_transaksi"><i class="fas fa-fw fa-money-bill-wave"></i><span>Data Penjualan</span></a></li>
            <li class="nav-item <?= ($menu == 'proses_apriori') ? 'active' : '' ?>"><a class="nav-link" href="index.php?menu=proses_apriori"><i class="fas fa-fw fa-sync"></i><span>Data Proses</span></a></li>
            <li class="nav-item <?= ($menu == 'hasil' || $menu == 'view_rule') ? 'active' : '' ?>"><a class="nav-link" href="index.php?menu=hasil"><i class="fas fa-fw fa-coins"></i><span>Data Hasil</span></a></li>
            <hr class="sidebar-divider d-none d-md-block">
            <div class="text-center d-none d-md-inline"><button class="rounded-circle border-0" id="sidebarToggle"></button></div>
        </ul>
        <!-- End of Sidebar -->

        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3"><i class="fa fa-bars"></i></button>
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><?= htmlspecialchars($_SESSION['apriori_username']) ?></span>
                                <img class="img-profile rounded-circle" src="assets/img/user.png">
                            </a>
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                <a href="index.php?menu=profile" class="dropdown-item">Profile KemKem Ulos</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal"><i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>Keluar</a>
                            </div>
                        </li>
                    </ul>
                </nav>
                <!-- End of Topbar -->
                
                <div class="container-fluid">
                    <?php
                    // Logika untuk menampilkan halaman
                    if ($menu != '') {
                        if (can_access_menu($menu)) {
                            if (file_exists($menu . ".php")) {
                                include $menu . '.php';
                            } else { include "not_found.php"; }
                        } else { include "forbidden.php"; }
                    } else { include "home.php"; }
                    ?>
                </div>
            </div>
            
            <!-- Modal Logout -->
            <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header"><h5 class="modal-title">Ready to Leave?</h5><button class="close" type="button" data-dismiss="modal"><span>×</span></button></div>
                        <div class="modal-body">Apakah anda yakin ingin keluar?</div>
                        <div class="modal-footer"><button class="btn btn-warning" type="button" data-dismiss="modal">Tidak</button><a class="btn btn-success" href="logout.php">Ya</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Skrip-skrip lain yang tidak perlu dipindah -->
    <script src="assets/js/sb-admin-2.min.js"></script>
    <script src="assets/js/demo/datatables-demo.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slim-select/1.27.0/slimselect.min.js"></script>
    
    <!-- Blok JavaScript untuk inisialisasi plugin -->
    <script type="text/javascript">
        $(document).ready(function() {
            // Inisialisasi Date Range Picker
            $('input[name="range_tanggal"]').daterangepicker({
                'applyClass': 'btn-sm btn-success',
                'cancelClass': 'btn-sm btn-default',
                locale: {
                    applyLabel: 'Terapkan',
                    cancelLabel: 'Batal',
                    format: 'DD/MM/YYYY'
                }
            });

            // Inisialisasi Slim Select
            if(document.getElementById('multiple')){
                 new SlimSelect({ select: '#multiple' });
            }
        });
    </script>
</body>
</html>
