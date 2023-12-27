<?php 

    include 'model\scheduleModel.php';

    class scheduleController {
        function get_schedules() {
            $schedule = new scheduleDAO();
            $schedules=$schedule->getSchedules();
            include 'view\scheduleList.php';
        }
    }


?>