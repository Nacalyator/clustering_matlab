%file = strcat('E:\Диссертация\MatLab\Clustering', '\', 'В12ОВ_01_20160111 full.xlsx');
%file = 'C:\Users\Антон\Dropbox\Documents\Диссертация\MatLab\Clustering\В12ОВ_01_20160111 full.xlsx';
%create_clusters_plots(file);

%   Забиваем путь до корневой папки с данными
root_dir = 'F:\Диссертация\Experimental\Данные о предельной прочности образцов + АЭ\АЭ статистика';
%   Получаем список файлов с учётом расширения файлов и игнорирование
%   файлов с данными по локации сигналов
files = searcher(root_dir, 'xlsx', 'loc');
%   Когда получили файлы, начинаем рассчёт
%   Определяем количество файлов
files_counts = length(files);
%   Перебираем циклов
for i = 1:files_counts
%   Создаём графики
    create_clusters_plots(files{i, 1});
end

disp('Well done!');