<?php 
session_start();
include('../includes/connect.php');
include('../functions/common_function.php');

// Retrieve name from session
$name = isset($_SESSION['username']) ? $_SESSION['username'] : '';

// Initialize amount_due variable
$amount_due = '';

// If order ID is available in the URL, fetch amount from the user_orders table
if (isset($_GET['order_id'])) {
    $order_id = $_GET['order_id'];
    $query = "SELECT amount_due FROM user_orders WHERE order_id = $order_id";
    $result = mysqli_query($con, $query);
    if ($result && $row = mysqli_fetch_assoc($result)) {
        $amount_due = $row['amount_due'];
    } else {
        // Display error message or handle gracefully
        $amount_due = "Error retrieving amount due.";
    }
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pay</title>
    <!-- Bootstrap CSS link -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- Font Awesome link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        form {
            width: 300px;
            margin: 0 auto;
            background: beige;
        }

        input[type="textbox"],
        input[type="button"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="button"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }

        input[type="button"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="container-fluid p-0">
        <!-- First child -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <img src="./images/logo.jpg" alt="" class="logo">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                      <li class="nav-item">
                          <a class="nav-link active" aria-current="page" href="../index.php">Home</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" href="../display_all.php">Menu</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" href="../contact.php">Contact</a>
                      </li>
                  </ul>
                </div>
            </div>
        </nav>
    </div>

    <div class="container items-align-center">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
        <form class="text-center border rounded p-4">
            <input type="textbox" name="name" id="name" placeholder="Enter your name" value="<?php echo $name; ?>" /><br/><br/>
            <input type="textbox" name="amt" id="amt" placeholder="Enter amt" value="<?php echo $amount_due; ?>" /><br/><br/>
            <input type="button" name="btn" id="btn" value="Pay Now" onclick="pay_now()" />
        </form>

        <script>
            function pay_now(){
                var name = jQuery('#name').val();
                var amt = jQuery('#amt').val();
                
                jQuery.ajax({
                    type:'post',
                    url:'payment_process.php',
                    data:"amt="+amt+"&name="+name,
                    success:function(result){
                        var options = {
                            "key": "rzp_test_Wz48luqYd6bAGf", 
                            "amount": amt*100, 
                            "currency": "INR",
                            "name": "canteen",
                            "description": "Test Transaction",
                            "image": "https://www.vecteezy.com/vector-art/166375-canteen-illustration",
                            "handler": function (response){
                                jQuery.ajax({
                                    type:'post',
                                    url:'payment_process.php',
                                    data:"payment_id="+response.razorpay_payment_id,
                                    success:function(result){
                                        window.location.href="profile.php";
                                    }
                                });
                            }
                        };
                        var rzp1 = new Razorpay(options);
                        rzp1.open();
                    }
                });
            }
        </script>
    </div>
</body>
</html>
