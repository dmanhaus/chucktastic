Impulse imp => dac;

while( true )
{
  Math.random2f(.01,.1) ::second => now;
  1.0 => imp.next;
}