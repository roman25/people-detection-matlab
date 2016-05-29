function differ = differHists(hist1, hist2)

sumHist1 = sum(hist1);
sumHist2 = sum(hist2);

coeff = 0;
for i = 1:length(hist1)
   coeff = coeff + (sqrt(hist1(i)*hist2(i))/sqrt(sumHist1*sumHist2));
end

differ = sqrt(1-coeff);

end