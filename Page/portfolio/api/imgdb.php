<?php

	function connect() {

		$db = mysqli_connect("**db_server**", "**user**", "**password**", "**db_name**");

	    if(!$db) {
	      echo "Verbindungsfehler: ".mysqli_connect_error();
	    }

	    return $db;
	}


	function writeToDB($db, $fn_resized, $fn_thumb, $cat, $date, $album, $descr, $title) {


		if (!($stmt = $db->prepare("INSERT INTO images (
										filename_resized, filename_thumb, cat, date, album, descr, title)
										VALUES (?,?,?,?,?,?,?);"))) {
			echo "Prepare failed: (" . $mysqli->errno . ") " . $mysqli->error;
		}
		if (!$stmt->bind_param("sssssss", $fn_resized, $fn_thumb, $cat, $date, $album, $descr, $title)) {
			echo "Binding parameters failed: (" . $stmt->errno . ") " . $stmt->error;
		}

		if (!$stmt->execute()) {
			echo "Execute failed: (" . $stmt->errno . ") " . $stmt->error;
		}

		$stmt->close();


		// $done = $db->query("INSERT INTO images (
		// 								filename, filename_resized, filename_thumb, cat, date, descr, title) VALUES (
		// 								'".$filename."','".$fn_resized."','".$fn_thumb."',".$cat.",'".$date."','".$descr."','".$title."');");
		// if (!$done) {
		//     echo "Insert failed: (" . $db->errno . ") " . $db->error;
		// }
		// else {

		// }


	}

	function close($db) {

	    if (mysqli_close($db)) {
	    	echo "Connection closed";
	    }

	}

?>