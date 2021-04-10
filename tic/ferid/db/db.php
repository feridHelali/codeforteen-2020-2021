<?php
  class Database{
      private $connection;
      public function connect_to_database(){
        $dbhost = '192.168.1.16';
        $dbuser = 'ferid';
        $dbpass = 'toto';
        $dbname = 'ferid_db';
    
        $this->connection = mysqli_connect($dbhost, $dbuser, $dbpass,$dbname);

        if(! $this->connection ) {
            die('Could not connect: ');
        }
        
        echo 'Connected successfully';
        return $this->connection;
    }

    public  function close_database(){
        mysqli_close($this->connection);
    }
}
?>