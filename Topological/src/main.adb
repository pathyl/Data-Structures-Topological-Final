with Ada.Text_IO;
use ada.Text_IO;
with GenericTopologicalSort;
with MyIO;
procedure Main is
   package MyTopologicalSort is new GenericTopologicalSort(Integer, MyTypes.RelationParser, MyTypes.Put);
begin
   MyTopologicalSort.TopologicalSort("inputD1.txt", "outputD1.txt");
   MyTopologicalSort.TopologicalSort("inputD2.txt", "outputD2.txt");
end Main;

