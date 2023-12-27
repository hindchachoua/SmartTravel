<?php
    require_once 'db_connection\connection.php';

    class bus {

        private $bus_number;
        private $regist_number;
        private $capacity;
        private $busniess_name;

        public function __construct($bus_number, $regist_number, $capacity, $busniess_name) {
            $this->bus_number = $bus_number;
            $this->regist_number = $regist_number;
            $this->capacity = $capacity;
            $this->busniess_name = $busniess_name;
        }
        

        public function getBus_number()
        {
                return $this->bus_number;
        }

        /**
         * Get the value of regist_number
         */ 
        public function getRegist_number()
        {
                return $this->regist_number;
        }

        /**
         * Get the value of capacity
         */ 
        public function getCapacity()
        {
                return $this->capacity;
        }

        /**
         * Get the value of busniess_name
         */ 
        public function getBusniess_name()
        {
                return $this->busniess_name;
        }
    }

    class busDAO {

        private $db;
        public function __construct() {
            $this->db = Database::getInstance()->getConnection();
        }

        public function getBuses() {
            $stmt = $this->db->query("SELECT * FROM bus");
            $stmt->execute();
            $busesData = $stmt->fetchAll();
            $buses = array();
            foreach ($busesData as $BD) {
                $buses[] = new bus($BD["bus_number"], $BD["regist_number"], $BD["capacity"], $BD["busniess_name"]);
            }
            return $buses;
        }
    }



?>