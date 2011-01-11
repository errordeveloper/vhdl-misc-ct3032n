
/** This function returns integer sample */
int getX( void );

#define L 7 /** Length of given sequence */

/** An interesting patter to be detected */
int Z[L] = { 123, 234, 345, 456, 567, 678, 790 };

int main ( void )
{
  int i;

  while(1) {

    for ( i = 0; i < L; i++ ) {

       if ( getX() == Z[i] ) continue;

       else break;
    }

    /** Check loop exit index */
    if ( i == L ) return 0;

    /** Will try forever */
    else continue;

  } 

}
