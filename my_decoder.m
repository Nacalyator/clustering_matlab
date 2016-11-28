function out = my_decoder(in)
rus = [1040:1103 1025 1105]; % коды русских букв
if numel(find(rus==max(abs(in))))>0 % если есть русские буквы, то не надо перекодировать
    out = in;
else % перекодировка из dos (английские буквы при этом не меняются)
    a = unicode2native(in,'windows-1251');
    out = native2unicode(abs(a),'cp-866');
end
