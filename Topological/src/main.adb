with Ada.Text_IO;
use ada.Text_IO;
with GenericTopologicalSort;
with MyIO;
procedure Main is

   package MyTopologicalSort is new GenericTopologicalSort(Integer, MyIO.MyGet, MyIO.MyPut);

begin
   -- rest of program

   MyTopologicalSort.TopologicalSort;
end Main;

