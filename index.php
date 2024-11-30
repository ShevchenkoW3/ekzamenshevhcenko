<?php 
include 'template/head.php';
include 'template/db.php';
$message = "";
session_start();
if(!empty($_SESSION)){
        include 'template/nav_customer.php';
        $message = "Добро пожаловать, клиент!";
}
else{
    include 'template/nav.php';
    $message = "Добро пожаловать!<br><a href='login.php'>Авторизируйтесь</a> для доступа ко всем функциям сайта";
}
$sql = "select * from cars";
$result = $mysqli->query($sql);
?>
<section class="main">
    <div class="container">
        <div class="row" style="margin-top: 20px">
            <div class="col-lg-12">
                <h1 class="text-center"><?= $message ?></h1>
            </div>
        </div><br>
        <div class="row">
            <div class="col-lg-12">
            <table class="table">
            <thead>
            <tr class="table-primary">
                <th></th>
                <th>Название машины</th>
                <th>Стоимость аренды в сутки</th>
                <th></th>
            </tr>
            </thead>
            <tbody class="table-group-divider">
                <?php 
                if(!empty($result)){
                    foreach ($result as $row){
                        echo "
                        <tr>
                            <td><img class='img' src='img/".$row['img']."' width='256' height='128' alt='...'></td>
                            <td>".$row['name_car']."</td>
                            <td>".$row['price']."</td>";
                            session_start();
                            if(!empty($_SESSION)){
                                echo "<td><a href='new_arenda.php?id_car=".$row['id_car']."' role='button' class='btn btn-primary'>Взять в аренду</a></td>";
                            }
                            else{
                               echo "<td></td>"; 
                            }
                        echo "</tr>";
                    }
                }
                ?>
            </tbody>
        </table>
            </div>
        </div>
    </div>
</section>
<?php include 'template/footer.php'; ?>