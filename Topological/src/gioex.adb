--in file GIOEX.adb
  with Ada.Text_IO; use Ada.Text_IO;  -- Access restricted to body.
package body GIOEX is

  function Size(r: in Rectangle) return MyType is
    begin
      put("The Size of the Rectangle with length ");
      put(r.Length);
      put(" and width "); put(r.Width);  
      put(" is ");
      put(r.Length * r.Width);  
      put("!"); 
      new_line(2);
      return r.Length * r.Width;
    end Size;

  function RectLength(r: in Rectangle) return MyType is
  begin 
      put("The length is "); 
      put(r.Length); 
    new_line;
    return r.Length;
  end;
end GIOEX;
