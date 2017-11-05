<?php

$msg = "Upload";

// Comment Nov 5 '17:
// I guess back then I knew that this wasn't safe, but for the sake of getting shit done, left it at this...
if ($_SERVER['REQUEST_METHOD'] === 'POST' && $_POST['password'] === '**password**') {

    include_once("../wideimage/WideImage.php");
    include_once("imgdb.php");

    $db = connect();


    $cat = $_POST['cat'];
    $descr = $_POST['descr'];
    $title = $_POST['title'];
    $album = $_POST['album'];

    $date = $_POST['date'];

    $target_dir = "../img/" . $cat . "/";
    $filename = basename($_FILES["big_file"]["name"]);

    $imageFileType = pathinfo($filename, PATHINFO_EXTENSION);
    $imageFileType = strtolower($imageFileType);

    $filename_resized = pathinfo($filename, PATHINFO_FILENAME) . "_resized." . $imageFileType;
    $filename_thumb = pathinfo($filename, PATHINFO_FILENAME) . "_thumb." . $imageFileType;

    $uploadOk = 1;

    // Check if image file is a actual image or fake image
    if(isset($_POST["submit"])) {
        $check = getimagesize($_FILES["big_file"]["tmp_name"]);
        if($check !== false) {
            $msg = $msg . "File is an image - " . $check["mime"] . ".";
            $uploadOk = 1;
        } else {
            $msg = $msg . "File is not an image.";
            $uploadOk = 0;
        }
    }
    // Check if file already exists
    if (file_exists($target_dir.$filename)) {
        $msg = $msg . "Sorry, file already exists.";
        $uploadOk = 0;
    }
    // Check file size
    if ($_FILES["big_file"]["size"] > 50000000) {
        $msg = $msg . "Sorry, your file is too large.";
        $uploadOk = 0;
    }
    // Allow certain file formats
    if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
    && $imageFileType != "gif" ) {
        echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
        $uploadOk = 0;
    }
    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
        $msg = $msg . "Sorry, your file was not uploaded.";
    // if everything is ok, try to upload file
    }
    else {

        // if (!file_exists($target_dir)) {
        //     mkdir($target_dir;
        // }

        try {
            $image = WideImage::load("big_file");
        }
        catch (Exception $e){
            $msg = $msg . 'Coudln\'t load '.$_FILES['big_file']['name'].', Message: ' .$e->getMessage();
        }
        $image_resized = $image->resizeDown(800, 800, 'inside');

        $exif = exif_read_data($_FILES['big_file']['tmp_name']);
        $ort = $exif['Orientation'];

        $image_resized = WideImage::resetOrientation($image_resized, $ort);

        try {
            $image_resized->saveToFile($target_dir.$filename_resized);
        }
        catch (Exception $e){
            $msg = $msg . 'Coudln\'t save '.$filename_resized.', Message: ' .$e->getMessage();
        }

    	list($width, $height) = getimagesize($target_dir.$filename_resized);
    	$cropsize = min($width, $height);
    	$image_thumb = $image_resized->crop('center', 'center', $cropsize, $cropsize)->resizeDown(150, 150, 'inside');

    	$image_thumb->saveToFile($target_dir.$filename_thumb);


        $msg = $msg . "The file ". $filename . " has been resized, cropped and saved.";

        writeToDB($db, $filename_resized, $filename_thumb, $cat, $date, $album, $descr, $title);

        close($db);
    }

}

?>


<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Upload</title>
</head>
<body>
    <p><?php echo $msg ?></p>
    <form action="/portfolio/api/imgupload.php" method="POST" enctype="multipart/form-data">
        <label>Datei</label> <input type="file" name="big_file"/> <br>
        <label>Kategorie</label> <input type="text" name="cat" value="photos" required/> <span>1=Photos, 2=Graphics </span> <br>
        <label>Album</label> <input type="text" name="album" required/> </br>
        <label>Datum</label> <input type="date" name="date" value="20<?php echo date('y-m-d', time());  ?>"/> <br>
        <label>Titel</label> <input type="text" name="title"> <br>
        <label>Beschreibung</label> <input type="text" name="descr"> <br>

        <label>Passwort</label> <input type="text" name="password" required/>

        <input type="submit" value="Upload" name="submit">
    </form>
</body>
</html>