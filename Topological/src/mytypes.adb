with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Containers.Vectors;
package body MyTypes is
   
   
   
   package IntegerIO is new Ada.Text_IO.Integer_IO(Integer);
   
   function get(Job:  out Integer) return ParentPtr is
   begin
      
      Put_Line("GET");
      return null;
   end get;
   
   procedure put(Job:  in Integer) is
   begin
      IntegerIO.Put(Job);
   end put;

   function getIntegerValue(obj: in out IntegerType) return Integer is
   begin
      return obj.integerValue;
   end getIntegerValue;

end MyTypes;
