<?php
class Mysqli extends mysqli {
    public function __construct($host, $user, $pass, $db, $port, $socket, $charset) {
        mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
        parent::__construct($host, $user, $pass, $db, $port, $socket);
        $this->set_charset($charset);
    }
}
$db = new Mysqli('localhost', 'ferid', 'toto', 'account_db', 3306, null, 'utf8mb4');
var_dump($db);