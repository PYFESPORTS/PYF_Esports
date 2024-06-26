<?php

function getDataSchedule(){
    require_once __DIR__ . '/tools/databaseConn.php';
    require_once __DIR__ . '/classes/eventSchedule.php';
    require_once __DIR__ . '/classes/team.php';

    $DB = connectToDatabase();

    $events = array();

    try {
        $query = $DB->prepare('CALL getSchedule()');
        $query->execute();
        $result = $query->get_result();
        $query->close();

        while ($row = $result->fetch_assoc()) {
            $team1 = new Team($row['TeamA'], $row['TeamALogo']);
            $team2 = new Team($row['TeamB'], $row['TeamBLogo']);
            $date = date('F j', strtotime($row['matchDateTime']));
            $time = date('H:i', strtotime($row['matchDateTime']));
            $events[$date][] = new EventSchedule($date, $time, $team1, $team2, $row['type']);
        }

        return $events;

    } catch (Exception $e) {
        throw $e;
    }
}
