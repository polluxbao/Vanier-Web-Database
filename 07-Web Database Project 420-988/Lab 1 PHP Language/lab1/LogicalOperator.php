<html>
<head>
    <title>PHP Test</title>
</head>
<body>
    <?php 
    $degrees = "95";
    $hot = "yes";

    if((!$degrees > 100) || ($hot == "yes")) {
        echo "<p>TEST 1: It's <strong>really</strong> hot!</p>"; 
    } else {
        echo "<p>TEST 1: It's bearable.</p>"; 
    }
    
    if((!$degrees > 100) && ($hot == "yes")) {
        echo "<p>TEST 2: It's <strong>really</strong> hot!</p>"; 
    } else {
        echo "<p>TEST 2: It's bearable.</p>"; 
    }
    ?>
</body>
</html>