/*
1.static function and task share the same storage space for all the function and task.
2.Automatic function and task allocate the unique ,stacked storage for each function and task.
3.By default  functions declared are static except they are declared inside a class scope.
4.if function is declared within class scope, they behave as an automatic function by default unless they are specifically mentioned as static function.
5.All variable declared in a static function are static variable unless they are specifically mentioned as an automatic variables.
*/
module static_automatic;

  function static increment_static();
      static int count_A;
      automatic int count_B;
