<?php
if(isset($_GET['delete_order'])){
    $delete_order=$_GET['delete_order'];
    $delete_query="Delete from `orders_pending` where order_id=$delete_order";
    $result=mysqli_query($con,$delete_query);
    if($result){
        echo "<script>alert('Order is been deleted successfully')</script>";
        echo "<script>window.open('./orders.php?incoming_orders','_self')</script>";
    }
}
?>