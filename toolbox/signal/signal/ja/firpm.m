% FIRPM   Parks-McClellan???K?????b?v??FIR?t?B???^?????v 
%
% B = FIRPM(N,F,A) ???A?~?j?}?b?N?X?K?????g?????A?x?N?g?? F ?? A ???\??
% ???????g?????Q?C???????W?????K???????????? N+1?????`???? FIR ?t?B???^
% (?W??????????????)?????v???????BF ??0????1?????????????????????????g??
% ?_???x?N?g?????A1???T???v?????O???g????1/2?A?????????ANyquist ???g????
% ???B?????A???g?????A?????????????????????????BA ???AF ???????????_????
% ???]???????g?????????U?????\?????????x?N?g?????AF ???????T?C?Y????????
% ?????????????B
% 
% k ?????????????A???]???U?????A?_(F(k),A(k))???_(F(k+1),A(k+1))????????
% ???????????????Bk ?????????????A???]???U?????A???????????????????B????
% ???????_???????A?J???????A?????????A"?z??????????"?????????B???]??????
% ?g?????????U?????J?????????????A?????I?????`???????????????B???????A??
% ???a?????????????????????B
%
% B = FIRPM(N,F,A,W) ???A?x?N?g??W???d?????g???????????d?????t???????B??
% ?????????????????d??????????1???????????????????????B?]?????A?????? F 
% ?? A ???????????????????????B???????????A???????g????????????????????
% ???????????g???????????????????????????????d?????t?????A??????????????
% ?????????B
% 
% B = FIRPM(N,F,A,'Hilbert') ?? B = FIRPM(N,F,A,W,'Hilbert') ???A??????
% ???????????????????????`?????t?B???^?????v???????Bk = 1, ..., N+1 ????
% ?????AB(k) = -B(N+2-k) ?????B?????????????????A?S???????n???????I???U
% ????1?????? Hilbert???????????????B?????????AB = FIRPM(30,[.1 .9],...
% [1 1],'Hilbert') ?????B 
%
% B = FIRPM(N,F,A,'differentiator') ?? B = FIRPM(N,F,A,W,'differentiat-
% or') ???A?????????????????????A?[?????????U?????????????????????d???t
% ?????s???t?B???^???v???s???????B?d?????A???g?????t?????d?? W ?????Z??
% ?????????l???A?????????A?t?B???^???????g?????????????g?????t?B?b?g????
% ???B???????A???????????v???????B
%
% B = FIRPM(...,{LGRID}) ???A???g???O???b?h?????x???R???g???[??????????
% ??????1?s1?????Z???z?? {LGRID} ???g???????B???g???O???b?h?T?C?Y???A??
% ???????ALGRID*N/2*BW ?????g???_?????????????B???????ABW ???AF???????J
% ?o?[???????S???? [0,1] ???????????????????????BLGRID ???A?f?t?H???g??
% 16???????A???????????????A???????????????l???g???????BLGRID ??????????
% ?????A?????????????????????b?v???????????????v?Z???????????????B
%
% [B,ERR] = FIRPM(...) ???A???b?v?????????????????? ERR ???o?????????B
% 
% [B,ERR,RES] = FIRPM(...) ???A???????????o???????I?v?V???????v?Z??????
% ?????\???? RES ???o?????????B
% 
% RES.fgrid : ?t?B???^???v?????K?????g?p???????g???O???b?h???????x?N?g??
% RES.des   : opt.fgrid ???e?_???????????]???????g????
% RES.wt    : opt.fgrid ???????e?_?????????d??
% RES.H     : opt.fgrid ???????e?_?????????????????g??????
% RES.error : opt.fgrid (opt.des-opt.H) ???????e?_?????G???[
% RES.iextr : opt.fgrid ???????]???????g???????????C???f?b?N?X?x?N?g??
% RES.fextr : ?]???????g?????x?N?g??
%
% ?Q?l     FIRPMORD, CFIRPM, FIRLS, FIR1, FIR2, BUTTER, CHEBY1, CHEBY2, 
%          ELLIP, FREQZ, FILTER, FIRGR( Filter Design Toolbox ).



%   Copyright 1988-2002 The MathWorks, Inc.