<?php
class database {
    private $servername;
    private $user_db;
    private $password_db;
    private $database;
    public $koneksi;

    function __construct() {
        $this->load_conf_db();
        $this->connect_db();
    }

    function load_conf_db() {
        $path = dirname(__FILE__) . '/koneksi.php';
        if (file_exists($path)) {
            $conf = include $path;
            $this->servername = @$conf['host'];
            $this->database = @$conf['dbname'];
            $this->user_db = @$conf['username'];
            $this->password_db = @$conf['password'];
        }
    }

    public function connect_db() {
        $this->koneksi = mysqli_connect($this->servername, $this->user_db, $this->password_db, $this->database);
    }

    function db_query($sql) {
        return mysqli_query($this->koneksi, $sql);
    }

    function db_error($result) {
        return mysqli_error($this->koneksi);
    }

    function db_fetch_array($result) {
        return mysqli_fetch_array($result);
    }

    function db_num_rows($result) {
        return mysqli_num_rows($result);
    }
    
    function db_insert_id() {
        return mysqli_insert_id($this->koneksi);
    }

    function insert_record($table, array $val_cols) {
        $field = implode("`, `", array_keys($val_cols));
        $i = 0;
        foreach ($val_cols as $key => $value) {
            $escaped_value = mysqli_real_escape_string($this->koneksi, $value);
            $StValue[$i] = "'" . $escaped_value . "'";
            $i++;
        }
        $StValues = implode(", ", $StValue);
        $sql = "INSERT INTO $table (`$field`) VALUES ($StValues)";
        return $this->db_query($sql);
    }

    function update_record($table, array $set_val_cols, array $cod_val_cols) {
        $i = 0;
        foreach ($set_val_cols as $key => $value) {
            $escaped_value = mysqli_real_escape_string($this->koneksi, $value);
            $set[$i] = "`" . $key . "` = '" . $escaped_value . "'";
            $i++;
        }
        $Stset = implode(", ", $set);
        $i = 0;
        foreach ($cod_val_cols as $key => $value) {
            $escaped_value = mysqli_real_escape_string($this->koneksi, $value);
            $cod[$i] = "`" . $key . "` = '" . $escaped_value . "'";
            $i++;
        }
        $Stcod = implode(" AND ", $cod);
        $sql = "UPDATE $table SET $Stset WHERE $Stcod";
        return $this->db_query($sql);
    }
    
    function delete_record($table, array $val_cols) {
        $i = 0;
        foreach ($val_cols as $key => $value) {
            $exp[$i] = "`".$key."` = '" . mysqli_real_escape_string($this->koneksi, $value) . "'";
            $i++;
        }
        $Stexp = implode(" AND ", $exp);
        $sql = "DELETE FROM $table WHERE $Stexp ";
        return $this->db_query($sql);
    }
}
?>