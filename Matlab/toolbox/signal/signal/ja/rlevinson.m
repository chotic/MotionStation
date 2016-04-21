% RLEVINSON �́A�tLevinson-Durbin�A�[�@���������܂��B
%
% R = RLEVINSON(A,Efinal) �́A���~���Z(stepdown)�A���S���Y�����g���āA��
% �I�\���덷 Efinal �Ɨ\�������� A ���玩�ȑ��֌W�� R �����߂܂��BA �́A
% �ŏ��ʑ������������ŁAA(1) = 1 �ɉ��肵�Ă��܂��B
%
% [R,U] = RLEVINSON(...) �́A(P+1) �s (P+1) ��̏�O�p�s�� U ���o�͂���
% ���BU �́AP ����͑����� A �̎����Ƃ���Ƃ��Ai ���ł̗\�������� Ai(i =
% 1:P)���܂�ł��܂��B
% 
% �s�� U �̌^�́A�ȉ��̂悤�ɂȂ�܂��B
%
%         [ 1  a1(1)*  a2(2)* ..... aP(P)  * ]
%         [ 0  1       a2(1)* ..... aP(P-1)* ]
%   U  =  [ .................................]
%         [ 0  0       0      ..... 1        ]
%
% i ���̗\���������́AAi = U(i+1:-1:1,i+1)' ���g���Ē��o���邱�Ƃ��ł���
% ���BU �̍ŏ��̍s�́A���ˌW���̋����Ȃ��̂��܂�ł��܂��B�����āAK �́A
% conj(U(1,2:end))���g���āA���o�\�ł��B
%
% [R,U,K] = RLEVINSON(...) �́A���ˌW�� K ���o�͂��܂��B
% 
% [R,U,K,E] = RLEVINSON(...) �́A�x�N�g�� E �Ɏ����̍~�� (P,P-1,...,1)�ɁA
% �\���덷���o�͂��܂��B
%
% �Q�l�F   LEVINSON.



%   Copyright 1988-2002 The MathWorks, Inc.