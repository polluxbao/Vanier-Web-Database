<?php
class Calculation {
    private $val1;
    private $val2;
    private $typeop;
    private $resultop;

    //setters and getters
    function set_val1($value) {
        $this->val1 = $value;
    }

    function set_val2($value) {
        $this->val2 = $value;
    }

    function set_op($op) {
        $this->typeop = $op;
    }    

    function get_val1() {
        return $this->val1;
    }

    function get_val2() {
        return $this->val2;
    }

    function get_op() {
        return $this->typeop;
    }    

    function get_result() {
        return $this->resultop;
    }    

    function Add() {
        $this->typeop = "add";
        $this->resultop = $this->val1 + $this->val2;
        return $this->resultop;
    }

    function Subtract() {
        $this->typeop = "subtract";
        $this->resultop = $this->val1 - $this->val2;
        return $this->resultop;
    }

    function Multiply() {
        $this->typeop = "multiply";
        $this->resultop = $this->val1 * $this->val2;
        return $this->resultop;
    }

    function Divide() {
        $this->typeop = "divide";
        $this->resultop = $this->val1 / $this->val2;
        return $this->resultop;
    }
}

?>