<?php
    class Database{
        private $connection;
        public function connect_to_database(){
            $dbhost = '192.168.1.16';
            $dbuser = 'badie';
            $dbpass = 'toto';
            $db_name = 'ferid_db';
            $this->connection = mysqli_connect($dbhost, $dbuser, $dbpass,$db_name);

            if(! $this->connection ) {
                die('Could not connect: ');
            }

            echo 'Connected successefully';
            return $this->connection;

        }

        public function close_database(){
            mysqli_close($this->connection);
        }
    }
?>