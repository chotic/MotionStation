/*
 * @(#)ic_copy_scalar_rt.h    generated by: makeheader 4.21  Tue Mar 30 16:43:25 2004
 *
 *		built from:	ic_copy_scalar_rt.c
 */

#ifndef ic_copy_scalar_rt_h
#define ic_copy_scalar_rt_h

#ifdef __cplusplus
    extern "C" {
#endif

EXPORT_FCN void MWDSP_CopyScalarICs( byte_T       *dstBuff, 
                          const byte_T *ICBuff, 
                          int_T         numElems, 
                          const int_T   bytesPerElem );

#ifdef __cplusplus
    }	/* extern "C" */
#endif

#endif /* ic_copy_scalar_rt_h */