<?php
include 'template/head.php';
include 'template/db.php';
include 'template/nav_customer.php';
session_start();
$id_user = $_SESSION['id_user'];
$sql = "select * from arenda, cars, users where arenda.id_car = cars.id_car and arenda.id_user = $id_user order by id_arenda";
$result = $mysqli->query($sql);
?>
<div class="container">
<div class="row" style="margin-top: 20px;">
        <div class="col-lg-12">
        <table class="table">
            <thead>
            <tr class="table-primary">
                <th>№</th>
                <th>Название машины</th>
                <th>Начало аренды</th>
                <th>Конец аренды</th>
                <th>Сумма аренды</th>
            </tr>
            </thead>
            <tbody class="table-group-divider">
                <?php 
                if(!empty($result)){
                    foreach ($result as $row){
                        $d1 = new DateTimeImmutable($row['arenda_start']);
                        $d2 = new DateTimeImmutable($row['arenda_end']);
                        $d = $d1->diff($d2)->format('%R%a');
                        $s = $row['price']*$d;
                        echo "
                        <tr>
                            <td>".$row['id_arenda']."</td>
                            <td>".$row['name_car']."</td>
                            <td>".$row['arenda_start']."</td>
                            <td>".$row['arenda_end']."</td>
                            <td>".$s."</td>
                        </tr>
                        ";
                    }
                }
                ?>
            </tbody>
        </table>
        </div>
    </div>
</div>
</div>