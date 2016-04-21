/*=================================================================
 *
 * TRIANGLE.C
 *
 * Calculate the points in Sierpinski's triangle, an elementary
 * fractal. 
 *
 * This function calls a 
 * using MATLAB Compiler.
 *
 * Copyright 1984-2004 The MathWorks, Inc.
 *
 *=================================================================*/

#include <stdio.h>

/* Include the MCR header file and the library specific header file 
 * as generated by MATLAB Compiler
 */
#include "mclmcr.h" 
#include "libtriangle.h"

void usage(const char *name)
{
    printf("Usage: %s [number of points]\n"); 
    exit (-1);
}

int main(int ac, char *av[])
{
    
    /* Input parameters:
     *
     * iterations: Number of points to draw in the triangle
     * draw: If true, draw the triangle in a figure window before returning.
     */
    mxArray *iterations = NULL, *draw = NULL;

    /* The Sierpinski function returns the X and Y coordinates of the points
     * forming the pattern in the triangle.
     */
    mxArray *x = NULL, *y = NULL;

    /* Default number of iterations */
    int num_points = 7500;

    /* Validate the number of inputs */
    if (ac < 1 || ac > 2)
    {
	fprintf(stderr, "Expecting 0 or 1 input(s). Found %d\n", ac);
	usage(av[0]);
    }

    /* If we have the right number of inputs (1), try to convert the input
     * string to an integer.
     */
    if (ac == 2)
        num_points = atoi(av[1]);

    /* Type check on input argument -- atoi() will fail if the input is
     * not an integer.
     */
    if (num_points == 0)
    {
	fprintf(stderr, "First argument must be an integer.\n");
	usage(av[0]);
    }

    /* Create the input data */
    iterations = mxCreateDoubleScalar(num_points);
    draw = mxCreateLogicalScalar(1);
    
    /* Call the library intialization routine and make sure that the
     * library was initialized properly
     */
    mclInitializeApplication(NULL,0);
    if (!libtriangleInitialize())
    {
        fprintf(stderr,"could not initialize the triangle library properly\n");
        return -1;
    }

    /* Call the library function */
    mlfSierpinski(2, &x, &y, iterations, draw);

    /* Display the return value of the library function */
    printf("Calculated %d points\n", mxGetNumberOfElements(x));

    /* Free the memory used by the return values. */
    mxDestroyArray(x); x=NULL;
    mxDestroyArray(y); y=NULL;

    /* Call the library termination routine */
    libtriangleTerminate();
    
    /* Free the memory used by the input variables */
    mxDestroyArray(iterations); iterations=0;
    mxDestroyArray(draw); draw = 0;

    /* Shut down all MCR instances */
    mclTerminateApplication();

    /* Success */
    return 0;
}

