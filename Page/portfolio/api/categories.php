<?php 

include_once("imgdb.php");

if ($_SERVER['REQUEST_METHOD'] === 'GET') {

	$db = connect();

	$result = $db->query("SELECT descr FROM img_categories ORDER BY id ASC;");
	
	$cats = array();
	
	while($cat = mysqli_fetch_array($result, MYSQL_NUM)) {
		if ($cat[0] && $cat[0] != "") {
			$cats[] = $cat[0];
		}
	}

	mysqli_free_result($result);
	mysqli_close($db);

	header("Content-Type: application/json");
	echo json_encode($cats, JSON_PRETTY_PRINT);

}

?>