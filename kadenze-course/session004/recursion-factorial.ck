// recursion
fun int factorial (int x)
{
  if( x <= 1 ) // conditional expression goes here
  {
     // Exit Condition
     return 1;
  }
  else 
  {
    // recursive function calls itself
    return(x*factorial(x-1));
  }
}

// MAIN PROGRAM
// call factorial
<<< factorial(4) >>>;
