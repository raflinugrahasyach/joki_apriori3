<?php
session_start();

if (isset($_SESSION['apriori_id'])) {
    header("location:index.php");
}

$login = 0;
if (isset($_GET['login'])) {
    $login = $_GET['login'];
}

if ($login == 1) {
    $komen = "Silahkan Login Ulang, Cek username dan Password Anda!!";
}

include_once "fungsi.php";
?>

<!DOCTYPE HTML>
<html>
<head>
    <title>KemKem Ulos - Login</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    
    <link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
    <link href="assets/css/sb-admin-2.min.css" rel="stylesheet" />
    
    <style>
        /* * 1. MENGUBAH LATAR BELAKANG
         * Kode di bawah ini menargetkan elemen <body> dan memberinya kelas 'ulos-background'.
         * Properti 'background-image' langsung mengambil gambar dari URL internet.
         * Jadi, Anda tidak perlu mengunduh atau menyimpan gambar apa pun.
         */
        body.ulos-background {
            background-image: url('https://i0.wp.com/medanaktual.com/wp-content/uploads/2025/04/Mengenal-Ulos-Batak-Makna-Fungsi-dan-Jenisnya.jpg?fit=1366%2C582&ssl=1');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        .navbar-ulos {
            background-color: rgba(255, 255, 255, 0.8) !important;
            backdrop-filter: blur(5px);
        }

        /* * 2. MENGUBAH WARNA TOMBOL
         * Saya membuat kelas baru bernama '.btn-ulos'.
         * Kelas ini secara khusus mengatur warna tombol menjadi #6b0528 sesuai permintaan Anda.
         * Nanti di bagian tombol <button>, kita akan menambahkan class="btn-ulos" ini.
         */
        .btn-ulos {
            background-color: #6b0528 !important; 
            border-color: #6b0528 !important;
        }
        .btn-ulos:hover {
            background-color: #530420 !important;
            border-color: #530420 !important;
        }
    </style>
    </head>

<body class="ulos-background"> 
    <nav class="navbar navbar-expand-lg navbar-dark bg-white shadow-lg pb-3 pt-3 font-weight-bold navbar-ulos">
        <div class="container">
            <a class="navbar-brand text-danger" style="font-weight: 900;" href="#"> <i class="fa fa-tshirt mr-2 rotate-n-15"></i>
                KemKem Ulos
            </a>
        </div>
    </nav>

    <header class="text-center">
    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-xl-5 col-lg-5 col-md-5 mt-5">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Login Akun</h1>
                                    </div>
                                    <?php
                                    if (isset($komen)) {
                                        display_error("Username atau Password salah!");
                                    }
                                    ?>
                                    <form class="user" action="cek-login.php" method="post">
                                        <div class="form-group">
                                            <input autocomplete="off" name="username" type="text" class="form-control form-control-user" required placeholder="Username" />
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="password" class="form-control form-control-user" required placeholder="Password" />
                                        </div>
                                        
                                        <button type="submit" class="btn btn-danger btn-block btn-user btn-ulos"><i class="fas fa-fw fa-sign-in-alt mr-1"></i> Masuk</button>
                                    
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       </header>
                                    
        <script src="assets/vendor/jquery/jquery.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="assets/js/sb-admin-2.min.js"></script>
</body>
</html>