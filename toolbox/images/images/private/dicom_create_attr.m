function attr = dicom_create_attr
%DICOM_CREATE_ATTR  Create a structure to contain an attribute.
%   ATTR = DICOM_CREATE_ATTR create a structure ATTR to contain an
%   attribute's metadata.  The fields are filled with empty values.

%   Copyright 1993-2003 The MathWorks, Inc.
%   $Revision: 1.4.4.1 $  $Date: 2003/01/26 05:58:18 $

attr = struct('Name', '', ...
              'Group', [], ...
              'Element', [], ...
              'VR', '', ...
              'VM', [], ...
              'Length', []);