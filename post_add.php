<?php

$uploaddir = __DIR__.'/upload/';
$uploadfile = $uploaddir . basename($_FILES['userfile']['name']);

echo "<p>";

if (move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadfile)) {
    echo "File is valid, and was successfully uploaded.\n";
} else {
    echo "Upload failed";
}

if(!empty($_POST)) {
    include 'mysql.php';
    if(mysql_safe_query('INSERT INTO posts (title,body,date,image) VALUES (%s,%s,%s,%s)', $_POST['title'], $_POST['body'], time(),$_FILES['userfile']['name']))
        echo 'Entry posted. <a href="post_view.php?id='.mysql_insert_id().'">View</a>';
    else
        echo mysql_error();
}
?>

<form enctype="multipart/form-data" method="post">
	<table>
		<tr>
			<td><label for="title">Title</label></td>
			<td><input name="title" id="title" /></td>
		</tr>
		<tr>
			<td><label for="body">Body</label></td>
			<td><textarea name="body" id="body"></textarea></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" value="Post" /></td>
		</tr>
        <tr>
            <td></td>
            <input type="hidden" name="MAX_FILE_SIZE" value="512000" />
            <td><input name="userfile" type="file" /></td>
        </tr>
	</table>
</form>


<!--<form enctype="multipart/form-data" action="upload.php" method="POST">-->
<!--   -->