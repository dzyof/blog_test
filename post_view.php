<?php
include 'mysql.php';
$result = mysql_safe_query('SELECT * FROM posts WHERE id=%s LIMIT 1', $_GET['id']);

if(!mysql_num_rows($result)) {
    echo 'Post #'.$_GET['id'].' not found';
    exit;
}
$row = mysql_fetch_assoc($result);

$result = mysql_safe_query('SELECT * FROM comments WHERE post_id=%s ORDER BY date ASC', $_GET['id']);

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Blog Post - Start Bootstrap Template</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/blog-post.css" rel="stylesheet">

</head>

<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="/">Start Bootstrap</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Content -->
<div class="container">

    <div class="row">

        <!-- Post Content Column -->
        <div class="col-lg-8">

            <!-- Title -->
            <h1 class="mt-4"><?= $row['title'] ?></h1>

            <hr>

            <!-- Date/Time -->
            <p>Posted on <?= date('F j<\s\up>S</\s\up>, Y', $row['date']) ?></p>

            <hr>

            <!-- Preview Image -->
            <img width="150"  class="img-fluid rounded" src="/upload/<?=$row["image"] ?>" alt="">

            <hr>

            <!-- Post Content -->
            <p class="lead"><?= nl2br($row['body']) ?></p>
            <?php echo '<a href="post_edit.php?id='.$_GET['id'].'">Edit</a> | <a href="post_delete.php?id='.$_GET['id'].'">Delete</a> | <a href="index.php">View All</a>'; ?>

            <hr>

            <!-- Comments Form -->
            <div class="card my-4">
                <h5 class="card-header">Leave a Comment:</h5>
                <div class="card-body">

                    <form class="form-group" method="post" action="comment_add.php?id=<?=$_GET['id'] ?>">
                        <table>
                            <tr>
                                <td><label  for="name">Name:</label></td>
                                <td><input name="name" id="name" value="<?=$_COOKIE['name']?>"/></td>
                            </tr>
                            <tr>
                                <td><label for="email">Email:</label></td>
                                <td><input name="email" id="email" value="<?=$_COOKIE['email']?>"/></td>
                            </tr>
                            <tr>
                                <td><label for="website">Website:</label></td>
                                <td><input name="website" id="website" value="<?=$_COOKIE['website']?>"/></td>
                            </tr>
                            <tr>
                                <td><label  for="content">Comments:</label></td>
                                <td><textarea class="form-control"  name="content" id="content"></textarea></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input class="btn btn-primary"  type="submit" value="Post Comment"/></td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
            <!-- Single Comment -->
            <?php
            echo '<ol id="comments">';
            while($row = mysql_fetch_assoc($result)) {
                echo '<li id="post-'.$row['id'].'">';
                echo (empty($row['website'])?'<strong>'.$row['name'].'</strong>':'<a href="'.$row['website'].'" target="_blank">'.$row['name'].'</a>');
                echo ' (<a href="comment_delete.php?id='.$row['id'].'&post='.$_GET['id'].'">Delete</a>)<br/>';
                echo '<small>'.date('j-M-Y g:ia', $row['date']).'</small><br/>';
                echo nl2br($row['content']);

                echo '</li>';
            }
            echo '</ol>';
            ?>
        </div>


    </div>
    <!-- /.row -->

</div>
<!-- /.container -->

<!-- Footer -->
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
    </div>
    <!-- /.container -->
</footer>
<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>