unit U_pair;

interface
uses   System.Generics.Collections;             // ���

type
  �<T> = record
    Key, Value: T;
    constructor    Create(const K,V: T);
    function       ToString : string;
    class operator implicit (p:TPair<T,T>) : �<T>;
    class operator implicit (p:�<T>)       : TPair<T,T>;
  end;

  �_int = �<integer>; //TPair<integer,integer>;
  �_str = �<string>;  //TPair<string,string>;

  tp = record
       class function �<T>(a,b:T) : �<T>; static;
  end;

function  �(a,b:integer) : �_int; {TPair<integer,integer>;} overload;
function  �(a,b:string)  : �_str; {TPair<string,string>;}   overload;


implementation
uses System.Rtti, System.SysUtils;

class function tp.�<T>(a,b:T) : �<T>;
begin
      result := �<T>.Create(a,b);
end;

function  �(a,b:integer) : �_int; {TPair<integer,integer>;} overload;
begin
    result := tp.�(a,b);
end;

function  �(a,b:string) : �_str; {TPair<string,string>;} overload;
begin
    result := tp.�(a,b);
end;


constructor �<T>.Create(const K,V: T);
begin
   Key := K; Value := V;
end;

class operator �<T>.implicit (p:TPair<T,T>) : �<T>;
begin
   result.Create(p.Key,p.Value);
end;

class operator �<T>.implicit (p:�<T>) : TPair<T,T>;
begin
   result.Create(p.Key,p.Value);
end;

function �<T>.ToString : string;
begin
   case GetTypeKind(T) of
     tkInteger   : result := '(' + TValue.From<T>(Key).ToString + '  '
                                 + TValue.From<T>(Value).ToString +')';
     tkString,
     tkUString,
     tkLString,
     tkWString   : result := '("' + TValue.From<T>(Key).ToString + '"  "'
                                  + TValue.From<T>(Value).ToString +'")';
     tkChar,
     tkWChar     : result := 'char';
   else
                   result := 'x '; //+TValue.From<TTypeKind>(x).ToString;
   end;
end;


end.
