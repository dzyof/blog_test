<?php
include 'mysql.php';

$result = mysql_safe_query('SELECT * FROM posts WHERE category_id=%s ',$_GET['category_id'] );

if(!mysql_num_rows($result)) {
    echo 'No posts yet.';
} else {
    while($row = mysql_fetch_assoc($result)) {
        echo '<img width = 100   src="/upload/'.  $row["image"] .' " alt=""> </br>';
        echo '<h2>'.$row['title'].'</h2>';
        $body = substr($row['body'], 0, 300);
        echo nl2br($body).'...<br/>';
        echo '<a href="post_view.php?id='.$row['id'].'">Read More</a> | ';
        echo '<a href="post_view.php?id='.$row['id'].'#comments">'.$row['num_comments'].' comments</a>';
        echo '<hr/>';
    }
}


