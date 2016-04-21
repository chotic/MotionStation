% $Revision: 1.12 $
% Copyright 1994-2002 The MathWorks, Inc.

function custcodehelp(id)

if id == 0

  str = [...
   'These blocks insert custom code into the generated model files ' ...
   'and functions.  The four file blocks contain text fields to insert ' ...
   'custom user code at the top and bottom of the relevant header and ' ...
   'source files.  The seven function blocks contain text fields to ' ...
   'insert custom user code sections at the declarations, execution and ' ...
   'exit sections of the designated model functions.' ...
   ];

else

  str = [...
    'These eight blocks contain text fields to insert custom user code ' ...
    'sections at the declaration, execution and exit sections of the ' ...
    'designated subsystem functions.  By placing one of these blocks ' ...
    'inside a subsytem, the custom user code will appear in that ' ...
    'subsystem''s function.'...
   ];

end

helpdlg(str)

