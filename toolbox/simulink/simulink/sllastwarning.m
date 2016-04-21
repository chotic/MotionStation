function warns=sllastwarning(newWarns)
%SLLASTWARNING Simulink last warning message.
%   SLLASTWARNING by itself returns a Simulink diagnostic structure array
%   containing the last warning(s) generated by Simulink.  The fields of
%   the diagnostic structure are:
%
%     Type        'warning'
%     MessageID   the message ID for the warning (e.g., 'SL_InvSimulinkObjectName')
%     Message     the warning message
%     Handle      Simulink object handle(s) associated with the warning
%
%   SLLASTWARNING([]) resets the Simulink last warning so that it will return
%   an empty array until the next Simulink warning is encountered.
%
%   SLLASTWARNING(DIAGSTRUCT) will set the Simulink last warning(s) to those
%   specified in the DIAGSTRUCT.
%   
%   See also SLLASTDIAGNOSTIC, SLLASTERROR.

%   Copyright 1990-2002 The MathWorks, Inc.
%   $Revision: 1.5 $

%
% if no input args, return the last warning, otherwise, set it
%
if nargin == 0,
  
  %
  % the last warning is the last diagnostic less the errors
  %
  warns = sllastdiagnostic;
  if ~isempty(warns),
    errs = find(strcmp({ warns(:).Type },'error'));
    warns(errs) = [];
  end
  
else
  
  %
  % make sure that only warnings are being set
  %
  if ~isempty(newWarns),
    if ~all(strcmp({ newWarns(:).Type }, 'warning')),
      error('Type field of the Simulink diagnostic structure array must be ''warning''.');
    end
  end
  
  %
  % setting the last warning requires that the last errors
  % are preserved
  %
  errs = sllasterror;
  sllastdiagnostic([newWarns; errs]);
  
end