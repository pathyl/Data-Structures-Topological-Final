with Ada.Text_IO;
use ada.Text_IO;
--with GenericTopologicalSort;
with FileReader;
with MyTypes;
use MyTypes;
procedure Main is
   Arr: MyTypeArray(1..FileReader.NumItems);
   TempArr: Array(1..30) of Integer;


	--NA : Integer;

 package IntegerIO is new Ada.Text_IO.Integer_IO(Integer);
   --package IntegerTopologicalSort is new GenericTopologicalSort(Integer, IntegerIO.get, mytypes.put);
  -- use IntegerTopologicalSort;

begin
   -- rest of program
   Put_Line("MAIN");
   TempArr := (1,2,1,3,4,1,3,8,8,2,4,2,4,5,6,4,5,7,2,7,9,8,9,6,2,7,4,2,9,8);
   FileReader.ReadLines(Arr);
end Main;
