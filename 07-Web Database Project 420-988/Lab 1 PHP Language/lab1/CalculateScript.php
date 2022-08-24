<?php
if(($_POST["val1"] == "") || ($_POST["val2"] == "") || ($_POST["calc"] == "")) {
    header("Location: Calculate_form.html");
    exit;
}

if($_POST["calc"] == "add") {
    $result = $_POST["val1"] + $_POST["val2"];
} else if($_POST["calc"] == "subtract") {
    $result = $_POST["val1"] - $_POST["val2"];
} else if($_POST["calc"] == "multiply") {
    $result = $_POST["val1"] * $_POST["val2"];
} else if($_POST["calc"] == "divide") {
    $result = $_POST["val1"] / $_POST["val2"];
}

?>

<html>
<head>
    <title>Calculation Result</title>
</head>
<body>
    <p>The result of the calculation is: <?php echo "$result"; ?></p>
</body>
</html>