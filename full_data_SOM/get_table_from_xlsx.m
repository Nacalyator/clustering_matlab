function [sens1, sens2] = get_table_from_xlsx(file)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
%   Нужные нам столбцы:
%   1 - время суммарное; 2 - время шага (если есть шаг);
%   3 - суммарное количество сигналов; 4 - кол-во сигналов на шаге;
%   6 - Амплитуда
%   Получаем данные с интересующих нас таблиц
sens1 = xlsread(file, 'Фильтр. Сигналы1');
sens2 = xlsread(file, 'Фильтр. Сигналы2');
end