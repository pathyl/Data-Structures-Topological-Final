with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Containers.Vectors;
package body MyTypes is
   
   
   
   package IntegerIO is new Ada.Text_IO.Integer_IO(Integer);
   
   function RelationParser(Predecessor, Successor: out Parent; Current_Line: String) is
   begin
      --split the string into two objects
      --pass each object to identifier, which will in turn pass to constructor and pass back a completed object.
      --return objects to caller
      
   end RelationParser;
   
   
   --polymorhpic put functions for each type

end MyTypes;
