% clear all; close all; clc; ���������ǰ�ı������ر���ǰ�Ĵ��ڣ��������������µ�һ��Ҫ�������飬������Ϊ֮ǰ�ı�������ɴ���

clear all;close all;clc;

% ����Ҫ��Ҫ������̣���Ҫ�õ� bvp4c���÷����£�
%sol = bvp4c(odefun,bcfun,solinit)
%sol = bvp4c(odefun,bcfun,solinit,options)
%solinit = bvpinit(x, yinit,params)
% ������д����ʼ init��

% ��ʼ����Ӧ��ʲô��ʽ�أ�solinitӦ�ð������ǶԳ�ʼ�Ĳ²⡣solinit Ӧ�ð�����
% 1. ��ʼ��������Ϊ����Ҫ�����߽������Ļ�����Ҫ��һ����ɢ������������������
% 2. �Խ�Ĳ²⡣shooting method ��Ҫ�� Terminator �����������ص���ʼ��������
% 3. ���������е�δ֪�����ĳ�ʼ�²⡣������������е� beta��
% ���������������solinit ����дһ�������������������ֻд bvpinit(.....)

% �� beta ��ֵ�����ǲ�֪���ø�ʲôֵ�����ԾʹӸ���֮ǰ�����Ե���������Ĳ¸����ĳ�ʼ��
beta=99;

% ����Ҫ��������ʼ��״̬�ȡ�bvpinit()��һ�����ⶨ��ĺ�����@ ��
% function_handle��һ��������Ϊһ������������ʱ����֣�matlab ���ռ����еı�Ҫ�Ĺ��������������Ϣ������������
% @bc_init ���ǰ����б�Ҫ��bc_init����Ϣ���� bvpinit() .
init=bvpinit(linspace(-1,1,50),@bc_init,beta)

% ����Ҫ��ʹ�� bvp4c(��΢�ַ���,�߽�����,��ʼ����)��@ �� function handle������˵���ˡ�
sol = bvp4c(@rhs_bvp, @bc_bvp,init);

x=linspace(-1,1,100);

% deval(bvp4c�����Ľ�Ľṹ��,Ҫ�������Щɢ��)
BS = deval(sol,x);

% ���Ƴ�ͼ��
% colon (:) ��������ȡʸ����ĳЩ�
%    A(:,j)is the jth column of A.
%    A(i,:)is the ith row of A.
%    A(:,:)is the equivalent two-dimensional array. For matrices this is the same as A.
%    A(j:k)is A(j), A(j+1),...,A(k).
plot(x,BS(1,:))
