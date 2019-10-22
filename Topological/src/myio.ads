--in file myio.ads
with Ada.Text_IO;
use Ada.Text_IO;
package MyIO is
   procedure GetJobs(Precedent, Successor: out Integer; Current_Line: String);
   procedure MyPut(file: File_Type; Job: in Integer);
end MyIO;
