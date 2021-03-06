function codegen_axb
%CODEGEN_AXB create all C=A*B functions for all semirings
%
% This function creates all files of the form GB_AxB__*.[ch], including all
% built-in semirings (GB_AxB__*.c) and one include file, GB_AxB__include.h.

% The ANY operator is not used as a multiplicative operator in the generated
% functions.  It can be used as the multiplicative op in a semiring, but is
% renamed to SECOND before calling the generated function.

fprintf ('\nsemirings:\n') ;

f = fopen ('Generated/GB_AxB__include.h', 'w') ;
fprintf (f, '//------------------------------------------------------------------------------\n') ;
fprintf (f, '// GB_AxB__include.h: definitions for GB_AxB__*.c\n') ;
fprintf (f, '//------------------------------------------------------------------------------\n') ;
fprintf (f, '\n') ;
fprintf (f, '// SuiteSparse:GraphBLAS, Timothy A. Davis, (c) 2017-2020, All Rights Reserved.\n') ;
fprintf (f, '// http://suitesparse.com   See GraphBLAS/Doc/License.txt for license.\n') ;
fprintf (f, '\n') ;
fprintf (f, '// This file has been automatically generated from Generator/GB_AxB.h') ;
fprintf (f, '\n\n') ;
fprintf (f, '#include "GB_iterator.h"\n') ;
fprintf (f, '\n\n') ;
fclose (f) ;

% codegen_axb_template (multop, bmult, imult, fmult, dmult, fcmult, dcmult)

codegen_axb_template ('first',          ...
    'xarg',                             ... % bool
    'xarg',                             ... % int, uint
    'xarg',                             ... % float
    'xarg',                             ... % double
    'xarg',                             ... % GxB_FC32_t
    'xarg') ;                           ... % GxB_FC64_t

codegen_axb_template ('second',         ...
    'yarg',                             ... % bool
    'yarg',                             ... % int, uint
    'yarg',                             ... % float
    'yarg',                             ... % double
    'yarg',                             ... % GxB_FC32_t
    'yarg') ;                           ... % GxB_FC64_t

codegen_axb_template ('pair',           ...
    '1',                                ... % bool
    '1',                                ... % int, uint
    '1',                                ... % float
    '1',                                ... % double
    'GxB_CMPLXF(1,0)',                  ... % GxB_FC32_t
    'GxB_CMPLX(1,0)') ;                 ... % GxB_FC64_t

codegen_axb_template ('min',            ...
    [ ],                                ... % bool
    'GB_IMIN (xarg, yarg)',             ... % int, uint
    'fminf (xarg, yarg)',               ... % float
    'fmin (xarg, yarg)',                ... % double
    [ ],                                ... % GxB_FC32_t
    [ ]) ;                              ... % GxB_FC64_t

codegen_axb_template ('max',            ...
    [ ],                                ... % bool
    'GB_IMAX (xarg, yarg)',             ... % int, uint
    'fmaxf (xarg, yarg)',               ... % float
    'fmax (xarg, yarg)',                ... % double
    [ ],                                ... % GxB_FC32_t
    [ ]) ;                              ... % GxB_FC64_t

codegen_axb_template ('plus',           ...
    [ ],                                ... % bool
    '(xarg + yarg)',                    ... % int, uint
    '(xarg + yarg)',                    ... % float
    '(xarg + yarg)',                    ... % double
    'GB_FC32_add (xarg, yarg)',         ... % GxB_FC32_t
    'GB_FC64_add (xarg, yarg)') ;       ... % GxB_FC64_t

codegen_axb_template ('minus',          ...
    [ ],                                ... % bool
    '(xarg - yarg)',                    ... % int, uint
    '(xarg - yarg)',                    ... % float
    '(xarg - yarg)',                    ... % double
    'GB_FC32_minus (xarg, yarg)',       ... % GxB_FC32_t
    'GB_FC64_minus (xarg, yarg)') ;     ... % GxB_FC64_t

codegen_axb_template ('rminus',         ...
    [ ],                                ... % bool
    '(yarg - xarg)',                    ... % int, uint
    '(yarg - xarg)',                    ... % float
    '(yarg - xarg)',                    ... % double
    'GB_FC32_minus (yarg, xarg)',       ... % GxB_FC32_t
    'GB_FC64_minus (yarg, xarg)') ;     ... % GxB_FC64_t

codegen_axb_template ('times',        ...
    [ ],                                ... % bool
    '(xarg * yarg)',                    ... % int, uint
    '(xarg * yarg)',                    ... % float
    '(xarg * yarg)',                    ... % double
    'GB_FC32_mul (xarg, yarg)',         ... % GxB_FC32_t
    'GB_FC64_mul (xarg, yarg)') ;       ... % GxB_FC64_t

codegen_axb_template ('div',          ...
    [ ],                                ... % bool
    'GB_IDIV (xarg, yarg)',             ... % int, uint
    '(xarg / yarg)',                    ... % float
    '(xarg / yarg)',                    ... % double
    'GB_FC32_div (xarg, yarg)',         ... % GxB_FC32_t
    'GB_FC64_div (xarg, yarg)') ;       ... % GxB_FC64_t

codegen_axb_template ('rdiv',         ...
    [ ],                                ... % bool
    'GB_IDIV (yarg, xarg)',             ... % int, uint
    '(yarg / xarg)',                    ... % float
    '(yarg / xarg)',                    ... % double
    'GB_FC32_div (yarg, xarg)',         ... % GxB_FC32_t
    'GB_FC64_div (yarg, xarg)') ;       ... % GxB_FC64_t

codegen_axb_template ('iseq',           ...
    [ ],                                ... % bool
    '(xarg == yarg)',                   ... % int, uint
    '(xarg == yarg)',                   ... % float
    '(xarg == yarg)',                   ... % double
    [ ],                                ... % GxB_FC32_t
    [ ]) ;                              ... % GxB_FC64_t

codegen_axb_template ('isne',           ...
    [ ],                                ... % bool
    '(xarg != yarg)',                   ... % int, uint
    '(xarg != yarg)',                   ... % float
    '(xarg != yarg)',                   ... % double
    [ ],                                ... % GxB_FC32_t
    [ ]) ;                              ... % GxB_FC64_t

codegen_axb_template ('isgt',           ...
    [ ],                                ... % bool
    '(xarg > yarg)',                    ... % int, uint
    '(xarg > yarg)',                    ... % float
    '(xarg > yarg)',                    ... % double
    [ ],                                ... % GxB_FC32_t
    [ ]) ;                              ... % GxB_FC64_t

codegen_axb_template ('islt',           ...
    [ ],                                ... % bool
    '(xarg < yarg)',                    ... % int, uint
    '(xarg < yarg)',                    ... % float
    '(xarg < yarg)',                    ... % double
    [ ],                                ... % GxB_FC32_t
    [ ]) ;                              ... % GxB_FC64_t

codegen_axb_template ('isge',           ...
    [ ],                                ... % bool
    '(xarg >= yarg)',                   ... % int, uint
    '(xarg >= yarg)',                   ... % float
    '(xarg >= yarg)',                   ... % double
    [ ],                                ... % GxB_FC32_t
    [ ]) ;                              ... % GxB_FC64_t

codegen_axb_template ('isle',           ...
    [ ],                                ... % bool
    '(xarg <= yarg)',                   ... % int, uint
    '(xarg <= yarg)',                   ... % float
    '(xarg <= yarg)',                   ... % double
    [ ],                                ... % GxB_FC32_t
    [ ]) ;                              ... % GxB_FC64_t

codegen_axb_compare_template ('eq',     ...
    '(xarg == yarg)',                   ... % bool
    '(xarg == yarg)') ;                 ... % int, uint, float, double

codegen_axb_compare_template ('ne',           ...
    [ ],                                ... % bool
    '(xarg != yarg)') ;                 ... % int, uint, float, double

codegen_axb_compare_template ('gt',           ...
    '(xarg > yarg)',                    ... % bool
    '(xarg > yarg)') ;                  ... % int, uint, float, double

codegen_axb_compare_template ('lt',           ...
    '(xarg < yarg)',                    ... % bool,
    '(xarg < yarg)') ;                  ... % int, uint, float, double

codegen_axb_compare_template ('ge',           ...
    '(xarg >= yarg)',                   ... % bool
    '(xarg >= yarg)') ;                 ... % int, uint, float, double

codegen_axb_compare_template ('le',           ...
    '(xarg <= yarg)',                   ... % bool
    '(xarg <= yarg)') ;                 ... % int, uint, float, double

codegen_axb_template ('lor',          ...
    '(xarg || yarg)',                   ... % bool
    '((xarg != 0) || (yarg != 0))',     ... % int, uint
    '((xarg != 0) || (yarg != 0))',     ... % float
    '((xarg != 0) || (yarg != 0))',     ... % double
    [ ],                                ... % GxB_FC32_t
    [ ]) ;                              ... % GxB_FC64_t

codegen_axb_template ('land',         ...
    '(xarg && yarg)',                   ... % bool
    '((xarg != 0) && (yarg != 0))',     ... % int, uint
    '((xarg != 0) && (yarg != 0))',     ... % float
    '((xarg != 0) && (yarg != 0))',     ... % double
    [ ],                                ... % GxB_FC32_t
    [ ]) ;                              ... % GxB_FC64_t

codegen_axb_template ('lxor',         ...
    '(xarg != yarg)',                   ... % bool
    '((xarg != 0) != (yarg != 0))',     ... % int, uint
    '((xarg != 0) != (yarg != 0))',     ... % float
    '((xarg != 0) != (yarg != 0))',     ... % double
    [ ],                                ... % GxB_FC32_t
    [ ]) ;                              ... % GxB_FC64_t

% bitwise semirings
ops   = { 'bor', 'band', 'bxor', 'bxnor' } ;
funcs = { '(xarg | yarg)', '(xarg & yarg)', '(xarg ^ yarg)', '~(xarg ^ yarg)' };
adds  = { 'w |= t'       , 'w &= t'       , 'w ^= t'       , 'w = ~(w ^ t)'   };
ids   = {  0             , 1              , 0              , 1                };
terms = {  1             , 0              , [ ]            , [ ]              };
atomx = {  1             , 1              , 1              , 0                };

nbits = [8 16 32 64] ;
bits =  { '0xFF', '0xFFFF', '0xFFFFFFFF', '0xFFFFFFFFFFFFFFFF' } ;

for i = 1:4
    addop = ops {i} ;
    fprintf ('\n%-7s', addop) ;
    addfunc = strrep (strrep (funcs {i}, 'xarg', 'w'), 'yarg', 't') ;
    add = adds {i} ;
    identity = ids {i} ;
    term = terms {i} ;
    at = atomx {i} ;

    for j = 1:4
        multop = ops {j} ;
        mult = funcs {j} ;
        for k = 1:4
            fprintf ('.') ;
            type = sprintf ('uint%d_t', nbits (k)) ;
            if (isempty (term))
                tm = [ ] ;
            elseif (term)
                tm = bits {k} ;
            else
                tm = '0' ;
            end
            if (identity)
                id = bits {k} ;
            else
                id = '0' ;
            end
            % fprintf ('%s %s %s %s %s %s %s %s %s %d 0\n', ...
            % addop, multop, add, addfunc, mult, type, type, id, tm, at) ;
            codegen_axb_method (addop, multop, add, addfunc, mult, type, ...
                type, id, tm, at, 0) ;
        end
    end

end

fprintf ('\n') ;

