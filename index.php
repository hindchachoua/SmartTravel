<?php 

    // include 'view/home.php';

    include 'controller/cityController.php';
    $citycontroller = new cityController();
    $citycontroller->get_city();


?>