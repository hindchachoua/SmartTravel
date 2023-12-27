<?php
    include 'model\cityModel.php';
    

    class cityController {
        function get_city() {
            $city = new cityDAO();
            $cities=$city->getCities();
            include 'view/home.php';
        }
    }




?>