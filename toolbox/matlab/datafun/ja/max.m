% MAX   �ő�v�f
% 
% X���x�N�g���̏ꍇ�AMAX(X)�́AX�̍ő�v�f���o�͂��܂��BX���s��̏ꍇ�A
% MAX(X)�́A�e��̍ő�v�f���܂ލs�x�N�g�����o�͂��܂��BX��N�����z���
% �ꍇ�AMAX(X)�͍ŏ���1�łȂ������ɂ��čő�v�f���o�͂��܂��B
%
% [Y,I] = MAX(X)�́A�x�N�g��I�ɍő�l�̃C���f�b�N�X���o�͂��܂��B�ŏ���
% 1�łȂ������ŁA�ő�l�����v�f����������ꍇ�́A�ŏ��̃C���f�b�N�X��
% �o�͂���܂��B
%
% MAX(X,Y)�́AX,Y�̑Ή�����v�f�̓��A�傫�����̂��o�͂��AX,Y�Ɠ����T�C
% �Y�̔z����o�͂��܂��B�܂��AX,Y�̂ǂ��炩���X�J���ł��\���܂���B
%
% [Y,I] = MAX(X,[],DIM)�́A����DIM�ɑ΂��ċ@�\���܂��B 
%
% ���f���̓��͂ɑ΂��ẮAMAX(ABS(X))���g���A�p�xANGLE(X)�͖�������
% �܂��B�ő�v�f�̌v�Z�ł́ANaN�𖳎����܂��B 
%
% ���: 
%   X = [2 8 4   �̏ꍇ�Amax(X,[],1)��[7 8 9]�ł��B
%        7 3 9]
%
%   max(X,[],2)�́A[8  �ŁAmax(X,5)�́A[5 8 5
%                   9]                  7 5 9]�ł��B
%
% �Q�l�FMIN, MEDIAN, MEAN, SORT.


%   Copyright 1984-2002 The MathWorks, Inc. 
%   $Revision: 1.9.4.1 $  $Date: 2004/04/28 01:46:54 $