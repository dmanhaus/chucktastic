// array declaration (1st way)
// int A[7]; // Declare a new integer array named A with 7 blocks of storage
// 54 => A[0]; // Store 54 in index position 0 of the array
// 56 => A[1];
// 62 => A[2];
// 54 => A[3];
// 48 => A[4];
// 50 => A[5];
// 52 => A[6];

// array declaration (2nd way)
// Empty brackets after array name shows that any number of blocks is allowed
// @=> signifies that the list is dynamic and can change over time
[ 54, 56, 62, 54, 48, 50, 52] @=> int A[]; 

// array lookup
A[1] => int data;

<<< data >>>;

58 => A[1]; // reassign the value of array A index 1 to 58