unit U_pair;

interface
uses   System.Generics.Collections;             // ßþÞ

type
  ß<T> = record
    Key, Value: T;
    constructor    Create(const K,V: T);
    function       ToString : string;
    class operator implicit (p:TPair<T,T>) : ß<T>;
    class operator implicit (p:ß<T>)       : TPair<T,T>;
  end;

  þ_int = ß<integer>; //TPair<integer,integer>;
  þ_str = ß<string>;  //TPair<string,string>;

  tp = record
       class function þ<T>(a,b:T) : ß<T>; static;
  end;

function  þ(a,b:integer) : þ_int; {TPair<integer,integer>;} overload;
function  þ(a,b:string)  : þ_str; {TPair<string,string>;}   overload;


implementation
uses System.Rtti, System.SysUtils;

class function tp.þ<T>(a,b:T) : ß<T>;
begin
      result := ß<T>.Create(a,b);
end;

function  þ(a,b:integer) : þ_int; {TPair<integer,integer>;} overload;
begin
    result := tp.þ(a,b);
end;

function  þ(a,b:string) : þ_str; {TPair<string,string>;} overload;
begin
    result := tp.þ(a,b);
end;


constructor ß<T>.Create(const K,V: T);
begin
   Key := K; Value := V;
end;

class operator ß<T>.implicit (p:TPair<T,T>) : ß<T>;
begin
   result.Create(p.Key,p.Value);
end;

class operator ß<T>.implicit (p:ß<T>) : TPair<T,T>;
begin
   result.Create(p.Key,p.Value);
end;

function ß<T>.ToString : string;
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
