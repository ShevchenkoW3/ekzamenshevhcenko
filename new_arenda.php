<?php 
include 'template/head.php';
include 'template/db.php';
session_start();
$id_user = $_SESSION['id_user'];
if(!empty($_GET)){
    $id_car = $_GET['id_car'];
    if(!empty($_POST)){
        $user = $_POST['user'];
        $car = $_POST['car'];
        $arenda_start = $_POST['arenda_start'];
        $arenda_end = $_POST['arenda_end'];
        $sql = "insert into arenda (id_user, id_car, arenda_start, arenda_end) values ($user, $car, '$arenda_start', '$arenda_end')";
        $result = $mysqli->query($sql);
        header("Location: customer.php");
    }
}
?>
<div class="container">
    <div class="row">
        <div class="col-lg-1"></div>
        <div class="col-lg-10">
            <form class="form-inline" action="" method="POST">
                <input type="hidden" name="user" value="<?=$id_user?>">
                <input type="hidden" name="car" value="<?=$id_car?>">
                <div class="mb-3">
                    <label for="arenda_start" class="form-label">Дата начала аренды</label>
                    <input type="date" class="form-control" name="arenda_start" id="arenda-start" required>
                </div><br>
                <div class="mb-3">
                    <label for="arenda_end" class="form-label">Дата конца аренды</label>
                    <input type="date" class="form-control" name="arenda_end" id="arenda_end" required>
                </div><br>
                <div class="mb-3">
                    <button type="submit" class="btn btn-primary">Сохранить</button>
                </div>
            </form>
        </div>
        <div class="col-lg-1"></div>
    </div>
</div>