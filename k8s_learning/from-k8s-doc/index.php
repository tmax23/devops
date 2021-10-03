<?php
  $x = 0.0001;
  for ($i = 0; $i <= 1000000; $i++) {
    $x += sqrt($x);
  }
  echo "Hello from K8S!";
  echo "<br>";
  echo "SQTR(x) = " . $x;
?>
