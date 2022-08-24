<?php
class House {
    public $type;
    public $sqfootage;
    public $color;
}

$myhouse = new House();
$myhouse -> type = "condo";
$myhouse -> sqfootage = "786";
$myhouse -> color = "tan stucco";

echo "I live in a " . $myhouse -> color . " " . $myhouse -> sqfootage . " square feet " . $myhouse -> type;

?>