﻿{$APPTYPE CONSOLE}
program Project2;
uses
  system.SysUtils,
  System.Generics.Collections,
  U_pair in 'U_pair.pas';             //   † ‡ ° ' ‘ ’ … ₂ ₁


begin
    var ODict2 := TOrderedDictionary <string, string>.Create([ þ('one', 'London'), þ('two', 'Berlin'),
                                                               þ('three', 'Rome'), þ('four', 'Athens'),
                                                               þ('five','Madrid'), þ('six', 'Bruxelles'),
                                                               þ('seven','Paris')
                                                             ]);

    var xy₁ := þ(1,2);     //   tp.þ(1,2);
    var xy₂ := þ('1','2'); //   tp.þ('1','2');

    writeln(xy₁.ToString); 
    writeln(xy₂.ToString); 

    readln;
  end.






