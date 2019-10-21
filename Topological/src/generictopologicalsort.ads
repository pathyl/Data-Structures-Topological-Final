generic  -- You may modify this as required but observe the spirit.
   type SortElement is private;  -- An element J (or K) of the partial ordering J < K processed
   -- by the topological sort.  J and K represent objects in the partial ordering.
   with function RelationParser(Precedent, Successor: out SortElement; Current_Line: String); --get both J and K from the same line in the form "J < K"
   with procedure put(Job:  in SortElement);  --Print the value of J or K.

                                              
package GenericTopologicalSort is
   procedure TopologicalSort(inputname, outputname: String);
end GenericTopologicalSort;
