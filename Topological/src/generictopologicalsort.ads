--in file generictopologicalsort.ads
with Ada.Strings.Fixed;
with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Unchecked_Conversion;
generic  -- You may modify this as required but observe the spirit.
   type SortElement is private;  -- An element J (or K) of the partial ordering J < K processed
   -- by the topological sort.  J and K represent objects in the partial ordering.             
   with procedure getJobs(Precedent, Successor: out SortElement; Current_Line: String); --getJobs function to read integer relations from file in the form J<K
   with procedure put(file: File_Type; Job:  in SortElement);  --Print the value of J or K.

package GenericTopologicalSort is
   procedure TopologicalSort(inputFile, outputFile: String);
end GenericTopologicalSort;
