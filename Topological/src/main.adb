--in file main.adb
with Ada.Text_IO;
use Ada.Text_IO;
with GenericTopologicalSort;
with MyIO;
procedure Main is
   package MyTopologicalSort is new GenericTopologicalSort(Integer, MyIO.GetJobs, MyIO.MyPut);
begin
   MyTopologicalSort.TopologicalSort("inputD1.txt", "outputD1.txt");
   MyTopologicalSort.TopologicalSort("inputD2.txt", "outputD2.txt");
end Main;
