<html>
<head>
    <title>Printing Variables</title>
</head>
<body>
    <?php
    $a = 85;
    $b = 24;
    echo "<p>Original value of \$a is $a and the \$b is $b</p>";

    $c = $a + $b;
    echo "<p>Added \$a and \$b and got $c</p>";

    $c = $a - $b;
    echo "<p>Substracted \$b from \$a and got $c</p>";

    $c = $a * $b;
    echo "<p>Mutiplied \$a by \$b and got $c</p>";

    $c = $a / $b;
    echo "<p>Divided \$a by \$b and got $c</p>";

    $c = $a % $b;
    echo "<p>The modulus of \$a and \$b is $c</p>";
    ?>
</body>
</html>