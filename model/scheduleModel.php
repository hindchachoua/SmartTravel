<?php

    require_once 'db_connection/connection.php';

    class schedule {

        private $ID;
        private $start_time;
        private $arrival_time;
        private $the_date;
        private $price;
        private $bus_name;
        private $c_start;
        private $c_arriv;

        public function __construct($ID, $start_time, $arrival_time, $the_date, $price, $bus_name, $c_start, $c_arriv) {
            $this->ID = $ID;
            $this->start_time = $start_time;
            $this->arrival_time = $arrival_time;
            $this->the_date = $the_date;
            $this->price = $price;
            $this->bus_name = $bus_name;
            $this->c_start = $c_start;
            $this->c_arriv = $c_arriv;
        }


        /**
         * Get the value of ID
         */ 
        public function getID()
        {
                return $this->ID;
        }

        /**
         * Get the value of start_time
         */ 
        public function getStart_time()
        {
                return $this->start_time;
        }

        /**
         * Get the value of arrival_time
         */ 
        public function getArrival_time()
        {
                return $this->arrival_time;
        }

        /**
         * Get the value of the_date
         */ 
        public function getThe_date()
        {
                return $this->the_date;
        }

        /**
         * Get the value of price
         */ 
        public function getPrice()
        {
                return $this->price;
        }

        /**
         * Get the value of bus_name
         */ 
        public function getBus_name()
        {
                return $this->bus_name;
        }

        /**
         * Get the value of c_start
         */ 
        public function getC_start()
        {
                return $this->c_start;
        }

        /**
         * Get the value of c_arriv
         */ 
        public function getC_arriv()
        {
                return $this->c_arriv;
        }
    }


    class scheduleDAO {

        private $db;
        public function __construct() {
            $this->db = Database::getInstance()->getConnection();
        }
        public function getSchedules() {
            $stmt = $this->db->query("SELECT * FROM schedule");
            $stmt->execute();
            $schedulesData = $stmt->fetchAll();
            $schedules = array();
            foreach ($schedulesData as $SD) {
                $schedules[] = new schedule($SD["ID"], $SD["start_time"], $SD["arrival_time"], $SD["the_date"], $SD["price"], $SD["bus_name"], $SD["c_start"], $SD["c_arriv"]);
            }
            return $schedules;
        }

    }

?>