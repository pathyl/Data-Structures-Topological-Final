with Ada.Text_IO;
package MyIO is
   function MyGet(Job: out Integer) return integer;
   procedure MyPut(Job: in Integer);

end MyIO;
