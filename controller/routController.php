<?php 

    include 'model\routModel.php';

    class routController {
        function get_routs() {
            $rout = new routDAO();
            $routs=$rout->getRouts();
            include 'view\routList.php';
        }
    }


?>