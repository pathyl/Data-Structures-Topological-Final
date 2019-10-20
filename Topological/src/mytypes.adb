with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Containers.Vectors;
use Ada.Containers.Vectors;
package body MyTypes is
   
   
   
   package IntegerIO is new Ada.Text_IO.Integer_IO(Integer);
   
   function get(Job:  out Integer) return Integer is
   begin
      
      
   end get;
   
   procedure put(Job:  in Integer) is
   begin
      IntegerIO.Put(Job);
   end put;

   

end MyTypes;
