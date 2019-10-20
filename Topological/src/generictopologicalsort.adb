with Ada.Strings.Fixed;
with Ada.Text_IO;
use ada.Text_IO;
with Ada.Unchecked_Conversion;
package body GenericTopologicalSort is
   -- This should read (get) the relations and print (put) the results.
   type Node;
   type NodePointer is access Node;
   type Node is tagged record
      Suc: SortElement; --Sort element is an "object" placed in the stack. changed to integer from SortElement
      Next: NodePointer;
   end record;

   type JobElement is record
      Count: Integer := 0;  -- This field should be used for counting and as queue links.
      Top: NodePointer;
   end record;

   function Integer_To_Ptr is new Ada.Unchecked_Conversion(Integer, NodePointer);
   function SEtoint is new Ada.Unchecked_Conversion(SortElement, Integer);
   function inttoSE is new Ada.Unchecked_Conversion(Integer, SortElement);
   package IntegerIO is new Ada.Text_IO.Integer_IO(Integer);
   -- other declarations
   procedure TopologicalSort is   
      Precedent, Successor: SortElement;
      Ptr: NodePointer;
      -- Program to obtain the relations in the partial ordering,
      -- sort the jobs, and print results;   
      NA : Integer;
      numRelations: Integer;
      F, R, Y: Integer;

   begin 
      

      
      Put("Enter the number of jobs to be performed: ");
      IntegerIO.Get(NA);
      new_line;
      Put("Enter the number of relations J < K: ");
      IntegerIO.Get(numRelations);
      new_line;
      declare
         SortStructure: Array(0..NA) of JobElement;
         KN: Integer := numRelations;
      begin
         
         
         --1 Initialization
         for K in 1..NA loop
            SortStructure(K).Count := 0;
            SortStructure(K).Top := null;
         end loop;
         --2 Build The Data Structure
         for J in 1..numRelations loop
            Put_Line("Enter the task J in the relation J < K");
            Precedent := get(Precedent); 
            
            Put_Line("Enter the task K in the relation J < K");
            Successor := get(Successor);
            SortStructure(SEtoint(Successor)).Count := SortStructure(SEtoint(Successor)).Count + 1;
            Ptr := new Node'(Suc => Successor, Next => SortStructure(SEtoint(Precedent)).Top);
            SortStructure(SetoInt(Precedent)).Top := Ptr;
         end loop;
      
         --3 Initialize the Output Queue
         R := 0;
         SortStructure(0).Count := 0;
         for K in 1..NA loop
            if SortStructure(K).Count = 0 then
               SortStructure(R).Count := K;
               R := K;
            end if;
         end loop;
         F := SortStructure(0).Count;
      
         --4
      
         while F /= 0 loop
            put(inttoSE(F)); --Perform action F Output it CHANGE THIS
            KN := KN - 1;
            Ptr := SortStructure(F).Top;
            SortStructure(F).Top := Integer_To_Ptr(0);
            while Ptr /= Integer_To_Ptr(0) loop
               SortStructure(SEtoint(Ptr.Suc)).Count := SortStructure(SEtoint(Ptr.Suc)).Count - 1;
               if SortStructure(SEtoint(Ptr.Suc)).Count = 0 then
                  SortStructure(R).Count := SEtoint(Ptr.Suc); --Add to output Queue
                  R := SEtoint(Ptr.Suc);
               end if;
               Ptr := Ptr.Next;
            end loop;
            F := SortStructure(F).Count;
         end loop;
      
         --5
         if KN = 0 then
            new_line;
            Put_Line("Found a solution!");
         else
            new_line;
            Put_Line("Failed to find a solution!");
            for K in 1..NA loop
               SortStructure(K).Count := 0;
            end loop;
         end if;
      
         
         --6
         for K in 1..NA loop
            Ptr := SortStructure(K).Top;
            SortStructure(K).Top := Integer_To_Ptr(0);
            while (Ptr /= Integer_To_Ptr(0) and then SortStructure(SEtoint(Ptr.Suc)).Count = 0) loop
               SortStructure(SEtoint(Ptr.Suc)).Count := K;
               if Ptr /= Integer_To_Ptr(0) then
                  Ptr := Ptr.Next;
               end if;
            end loop;
         end loop;
         

         --7 Find a K with Qlink(K) /= 0. This will be part of the offending loop.
         Y := 1;
         while SortStructure(Y).Count = 0 loop
            Y := Y + 1;
         end loop;
         
         --8
  
         loop
            SortStructure(Y).Top := Integer_To_Ptr(1);
            Y := SortStructure(Y).Count;
            exit when SortStructure(Y).top /= Integer_To_Ptr(0);
         end loop;
         
         
         --9 Print the loop
         Put_Line("Printing offending loop");
         while SortStructure(Y).Top /= Integer_To_Ptr(0) loop
            put(inttoSE(Y));
            SortStructure(Y).Top := Integer_To_Ptr(0);
            Y := SortStructure(Y).Count;
         end loop;

         
         
      end;
   end TopologicalSort;
end GenericTopologicalSort;


