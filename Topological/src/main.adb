with Ada.Text_IO;
use ada.Text_IO;
--with GenericTopologicalSort;
with FileReader;
with MyTypes;
use MyTypes;
procedure Main is

   Arr: MyTypeArray(1..FileReader.NumItems);

	--NA : Integer;

 package IntegerIO is new Ada.Text_IO.Integer_IO(Integer);
   --package IntegerTopologicalSort is new GenericTopologicalSort(Integer, IntegerIO.get, mytypes.put);
  -- use IntegerTopologicalSort;

begin
   -- rest of program
   Put_Line("MAIN");
   FileReader.ReadLines(Arr);
end Main;
