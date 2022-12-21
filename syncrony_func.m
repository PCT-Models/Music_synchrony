%% Function - Synchrony TG WM 30-11-2020 Melbourne


function sync = syncrony_func(quant,data,window)

         [~,d] = knnsearch(quant,data);
         
          sync = sum(d)/(length(data)*1);
          %sync = d;

end








