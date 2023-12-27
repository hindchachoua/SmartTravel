<?php 

require_once 'db_connection/connection.php';

class business {
    private $short_name;
    private $full_name;
    private $img;

    public function __construct($short_name, $full_name, $img) {
        $this->short_name = $short_name;
        $this->full_name = $full_name;
        $this->img = $img;
    }

    

    /**
     * Get the value of short_name
     */ 
    public function getShort_name()
    {
        return $this->short_name;
    }

    /**
     * Get the value of full_name
     */ 
    public function getFull_name()
    {
        return $this->full_name;
    }

    /**
     * Get the value of img
     */ 
    public function getImg()
    {
        return $this->img;
    }
}


class businessDAO {

    private $db;
    public function __construct() {
        $this->db = Database::getInstance()->getConnection();
    }

    public function getBusinesses() {
        $stmt = $this->db->query("SELECT * FROM business");
        $stmt->execute();
        $businessesData = $stmt->fetchAll();
        $businesses = array();
        foreach ($businessesData as $BD) {
            $businesses[] = new business($BD["short_name"], $BD["full_name"], $BD["img"]);
        }
        return $businesses;
    }
}


?>