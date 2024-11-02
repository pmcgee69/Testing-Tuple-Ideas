{$APPTYPE CONSOLE}
program Project1;
uses
  System.Generics.Collections,
  U_pair in 'U_pair.pas';


begin
    var q   := [ þ('one', 'London'),  þ('two', 'Berlin'),  þ('three', 'Rome'),
                 þ('four', 'Athens'), þ('five','Madrid'),  þ('six', 'Bruxelles'),
                 þ('seven', 'Paris')
               ];
    var ODict1 := TOrderedDictionary <string, string>.Create(q);   //  <-- Error

    var ODict2 := TOrderedDictionary <string, string>.Create([ þ('one', 'London'), þ('two', 'Berlin'),
                                                               þ('three', 'Rome'), þ('four', 'Athens'),
                                                               þ('five','Madrid'), þ('six', 'Bruxelles'),
                                                               þ('seven','Paris')
                                                             ]);

    var ODict := TOrderedDictionary <string, string>.Create;
    ODict.Add ('one',  'London');
    ODict.Add ('two',  'Berlin');
    ODict.Add ('three','Rome');
    ODict.Add ('four', 'Athens');
    ODict.Add ('five', 'Madrid');
    ODict.Add ('six',  'Bruxelles');
    ODict.Add ('seven','Paris');


    var xy₁ := þ(1,2);
    var xy₂ := þ('1','2');

    writeln(xy₁.ToString); 
    writeln(xy₂.ToString); 
    readln;
  end.






