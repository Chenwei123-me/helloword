function d=fushi2(dat,g,op)
%��̬ѧ�����㷨,ʵ�ָ��ݽṹԪ��ԭ����������㷨���ο�������˶ʿ���ģ�"����"�����ʵ��...��  --by cwy--20110318
%g:�ṹԪ�أ����磺g=[1 1 1]Ϊ3����ı�ƽ�ͽṹԪ��
%op��0--g��ԭ���ڿ�ʼ�㣬1--g��ԭ�������ĵ㣨Ҫ��g����Ϊ��������2--g��ԭ����ĩ�㣻Ŀǰֻ֧�ִ�3��

len = length(dat);

len_g = length(g);

switch op
    case 1,
    org_piont = ceil(len_g/2);
    case 2,
      org_piont =  len_g;
  otherwise,
    org_piont = 1;

end

for i=1:len 
    dtmp(i) = dat(i);
     for j=1:len_g 
         if (i-org_piont+j) >= 1 && (i-org_piont+j) <=len
             tmp = dat(i-org_piont+j) - g(j);
           if tmp < dtmp(i)
               dtmp(i) = tmp;
           end
       end
    end
end

 d = dtmp;
% x=1:len;
% plot(x,dat,'b',x,d,'r');