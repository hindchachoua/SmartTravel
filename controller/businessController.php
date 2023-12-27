<?php

    include 'model\businessModel.php';

    class businessController {
        function get_businesses() {
            $business = new businessDAO();
            $businesses=$business->getBusinesses();
            include 'view\businessList.php';
        }
    }


?>