<?php


if(($_POST["val1"] == "") || ($_POST["val2"] == "") || ($_POST["calc"] == "")) {
    header("Location: Calculate_form2.html");
    exit;
}

include 'CalculationClass.php';
$Calc = new Calculation();
$Calc->set_val1($_POST["val1"]);
$Calc->set_val2($_POST["val2"]);


if($_POST["calc"] == "add") {
    $result = $Calc->Add();
} else if($_POST["calc"] == "subtract") {
    $result = $Calc->Subtract();
} else if($_POST["calc"] == "multiply") {
    $result = $Calc->Multiply();
} else if($_POST["calc"] == "divide") {
    $result = $Calc->Divide();
}

//Connect to MySQL Database
$dbhost = "localhost";
$dbuser = "root";
$dbpass = "";
$dbdatabase = "lab2db";
$dbtable = "valueform";

$mysqli = new mysqli($dbhost, $dbuser, $dbpass, $dbdatabase) or 
    die('Connect Error ('.$mysqli->connect_errno.') '.$mysqli->connect_error);

echo "Connected successfully<br>";

/*Define insert query*/
$query = "INSERT INTO ".$dbtable." VALUES (".$Calc->get_val1().", ".$Calc->get_val2().
                                    ", '".$Calc->get_op()."', ".$Calc->get_result().");";
$mysqli->query($query) or 
    die('Connect Error ('.$mysqli->connect_errno.') '.$mysqli->connect_error);

/*Define select query*/
$query = "SELECT * FROM " . $dbtable . ";";
$calcResult = $mysqli->query($query) or 
    die('Connect Error ('.$mysqli->connect_errno.') '.$mysqli->connect_error);

$total_result = 0;

while($calcRecord = $calcResult->fetch_array()) {
    $vf_val1 = $calcRecord["val1"];
    $vf_val2 = $calcRecord["val2"];
    $vf_typeop = $calcRecord["typeop"];
    $vf_resultop  = $calcRecord["resultop"];

    echo $vf_val1."&emsp;";
    echo $vf_val2."&emsp;";
    echo $vf_typeop."&emsp;";
    echo $vf_resultop."<br/>";

    $total_result = $total_result + $vf_resultop;
}

echo "<br>The result of the calulation is : " . $vf_resultop;
echo "<br>The total amount of all result is : " . $total_result;

$query="";
$mysqli->close();
?>

<html>
<head>
    <title>Calculation Result</title>
</head>
<body>
</body>
</html>