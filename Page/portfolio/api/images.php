<?php 

include_once("imgdb.php");

if ($_SERVER['REQUEST_METHOD'] === 'GET') {

	$cat = $_GET['cat'];
	$alb = $_GET['alb'];

	if ($cat && $alb && $cat != "" && $alb != "") {

		$db = connect();

		$cat = $db->real_escape_string($_GET['cat']);
		$alb = $db->real_escape_string($_GET['alb']);

		if (!($stmt = $db->prepare("SELECT * FROM images WHERE cat=? and album=? ORDER BY DATE DESC;"))) {
			echo "Prepare failed: (" . $mysqli->errno . ") " . $mysqli->error;
		}
		if (!$stmt->bind_param("ss", $cat, $alb)) {
		    echo "Binding parameters failed: (" . $stmt->errno . ") " . $stmt->error;
		}
		if (!$stmt->execute()) {
		    echo "Execute failed: (" . $stmt->errno . ") " . $stmt->error;
		}
		if (!$stmt->bind_result($id, $fn, $fn_res, $fn_th, $category, $date, $album, $descr, $title)) {
		    echo "Binding output parameters failed: (" . $stmt->errno . ") " . $stmt->error;
		}

		$images = array();

		while($stmt->fetch()) {
			$images[] = array("id"=>$id, "filename"=>$fn, "filename_resized"=>$fn_res, "filename_thumb"=>$fn_th, "cat"=>$category, "date"=>$date, "album"=>$album, "descr"=>$descr, "title"=>$title);
		}

		// $result = $db->query("SELECT * FROM images WHERE cat='".$cat."' and album='".$alb."';");
		
		// $images = array();
		
		// while($image = mysqli_fetch_array($result, MYSQL_ASSOC)) {
		// 	$images[] = $image;
		// }

		// mysqli_free_result($result);

		$stmt->close();
		mysqli_close($db);

		header("Content-Type: application/json");
		echo json_encode($images, JSON_PRETTY_PRINT);
	}
}

?>