<?php

    require_once 'db_connection\connection.php';

    class rout {

        private $ID;
        private $start_city;
        private $arrival_city;
        private $distance;
        private $duration;


        public function __construct($ID, $start_city, $arrival_city, $distance, $duration) {
            $this->ID = $ID;
            $this->start_city = $start_city;
            $this->arrival_city = $arrival_city;
            $this->distance = $distance;
            $this->duration = $duration;
        }
        

        /**
         * Get the value of ID
         */ 
        public function getID()
        {
                return $this->ID;
        }

        /**
         * Get the value of start_city
         */ 
        public function getStart_city()
        {
                return $this->start_city;
        }

        /**
         * Get the value of arrival_city
         */ 
        public function getArrival_city()
        {
                return $this->arrival_city;
        }

        /**
         * Get the value of distance
         */ 
        public function getDistance()
        {
                return $this->distance;
        }

        /**
         * Get the value of duration
         */ 
        public function getDuration()
        {
                return $this->duration;
        }
    }
    
    class routDAO {

        private $db;
        public function __construct() {
            $this->db = Database::getInstance()->getConnection();
        }
        public function getRouts() {
            $stmt = $this->db->query("SELECT * FROM route");
            $stmt->execute();
            $routsData = $stmt->fetchAll();
            $routs = array();
            foreach ($routsData as $RD) {
                $routs[] = new rout($RD["ID"], $RD["start_city"], $RD["arrival_city"], $RD["distance"], $RD["duration"]);
            }
            return $routs;
        }
    }


?>