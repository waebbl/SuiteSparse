//------------------------------------------------------------------------------
// GrB_Descriptor_wait: wait for a user-defined GrB_Descriptor to complete
//------------------------------------------------------------------------------

// SuiteSparse:GraphBLAS, Timothy A. Davis, (c) 2017-2020, All Rights Reserved.
// http://suitesparse.com   See GraphBLAS/Doc/License.txt for license.

//------------------------------------------------------------------------------

// In SuiteSparse:GraphBLAS, a user-defined GrB_Descriptor has no pending
// operations to wait for.  All this method does is verify that the descriptor
// is properly initialized.  Note that unlike other methods, passing in a NULL
// pointer, or a pointer to a NULL descriptor is valid, since a NULL descriptor
// results in default settings.

#include "GB.h"

GrB_Info GrB_Descriptor_wait // no work, just check if GrB_Descriptor is valid
(
    GrB_Descriptor *desc     // required; may not be NULL a pointer to NULL
)
{ 

    //--------------------------------------------------------------------------
    // check inputs
    //--------------------------------------------------------------------------

    GB_WHERE ("GrB_Descriptor_wait (&desc)") ;
    if (desc != NULL && (*desc) != NULL)
    { 
        GB_RETURN_IF_FAULTY (*desc) ;
    }

    //--------------------------------------------------------------------------
    // return result
    //--------------------------------------------------------------------------

    return (GrB_SUCCESS) ;
}

