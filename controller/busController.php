<?php 

    include 'model\busModel.php';


    class buscontroller {
        function get_buses() {
            $bus = new busDAO();
            $buses=$bus->getBuses();
            include 'view\busList.php';
        }
    }


?>