function [ prolongation ] = calculate_prolongation( amps, energies)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%   ќпредел€ем длину массива и создаЄм пустой массив нулей дл€ дальнейшего
%   заполнени€
size = length(amps);
prolongation = zeros(size, 1);
%   –ассчитываем значени€ продолжительности сигналов в цикле
for i = 1:size
    prolongation(i, 1) = (energies(i, 1) * 1000) / (amps(i, 1) * amps(i, 1));
end
end

