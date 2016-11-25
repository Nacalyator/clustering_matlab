function [ result ] = searcher(path, ext, filter)
%SEARCHER Summary of this function goes here
%   Функция принимает начальный путь path ('f:\') и расширение
%   искомого файла ext ('xlsx') и возвращает список файлов,
%   найденных при рекурсивном поиске по дереву.
%   
%   Реализация поиска файлов по расширению через CMD
[status, cmdout] = system(['WHERE /R ' '"' path '"' ' *.' ext]);
%   Если статус сообщает об удачном завершении процесса,
%   то исправляем кодировку и разбиваем строку на ячейки
%   с путями к файлам. Иначе выводим сообщение об ошибке
if status == 0;
    result = strsplit(my_decoder(cmdout), '\n');
    paths = result.';
    paths(end,:) = []; % удаляем пустую строку
else
    disp('Error!');
end
result = cell(0, 1);
all_paths_length = length(paths);
for i = 1:all_paths_length
    contain_filter_word = length(strfind(paths{i, 1}, filter));
    if ~contain_filter_word
        result(end + 1, 1) = paths(i, 1);
    end
end



end


