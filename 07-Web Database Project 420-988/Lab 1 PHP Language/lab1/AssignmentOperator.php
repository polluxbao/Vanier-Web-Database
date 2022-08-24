<html>
<head>
    <title>Printing Variables</title>
</head>
<body>
    <?php
    $origVar = "100";
    echo "<p>Original value \$origVar is $origVar</p>";

    $origVar += 25;
    echo "<p>Added value after 25 incrementation is $origVar</p>";

    $origVar -= 12;
    echo "<p>Substracted value after 12 decrementation is $origVar</p>";

    $origVar .= "Vanier";
    echo "<p>Concatenated string \$origVar with \"Vanier\" is $origVar</p>";
    ?>
</body>
</html>