<?php 

include_once("imgdb.php");

if ($_SERVER['REQUEST_METHOD'] === 'GET') {

	$db = connect();
	
	$cat = $db->real_escape_string($_GET['cat']);
	
	if (!($stmt = $db->prepare("SELECT DISTINCT album FROM images WHERE cat=? ORDER BY id ASC;"))) {
		echo "Prepare failed: (" . $mysqli->errno . ") " . $mysqli->error;
	}
	if (!$stmt->bind_param("s", $cat)) {
	    echo "Binding parameters failed: (" . $stmt->errno . ") " . $stmt->error;
	}
	if (!$stmt->execute()) {
	    echo "Execute failed: (" . $stmt->errno . ") " . $stmt->error;
	}
	if (!$stmt->bind_result($alb)) {
	    echo "Binding output parameters failed: (" . $stmt->errno . ") " . $stmt->error;
	}

	$albs = array();

	while($stmt->fetch()) {
		if ($alb && $alb != "") {
			$albs[] = $alb;
		}
	}

	$stmt->close();
	mysqli_close($db);

	header("Content-Type: application/json");
	echo json_encode($albs, JSON_PRETTY_PRINT);

}

?>