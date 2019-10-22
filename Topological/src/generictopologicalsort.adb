
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
   package IntegerIO is new Ada.Text_IO.Integer_IO(Integer);
   
   procedure TopologicalSort(inputFile, outputFile: String) is   
      Precedent, Successor: SortElement;
      Ptr: NodePointer;
      F, R, Y, NA, numRelations: Integer;
      dupe: Boolean := False;
      f1, f2 : File_Type;
   begin
      Ada.Text_IO.Open(File => f1, Mode => In_File, Name => inputFile);
      Ada.Text_IO.Open(File => f2, Mode => Out_File, Name => outputFile);

      NA := Integer'Value(Get_Line(f1));
      numRelations := Integer'Value(Get_Line(f1));
      
      declare
         SortStructure: Array(0..NA) of JobElement;
         KN: Integer := NA;
      begin
         
         --1 Initialization
         for K in 0..NA loop
            SortStructure(K).Count := 0;
            SortStructure(K).Top := null;
         end loop;
         
         --2 Build The Data Structure
         for J in 1..numRelations loop
            getJobs(Precedent, Successor, Get_Line(f1));
            
            --check for duplicates here
            --iterate through the nodes in each of Precedent's top to find duplicate Successor before adding.
            Ptr := SortStructure(SEtoint(Precedent)).Top; 
            dupe := False;
            while Ptr /= null loop --find duplicates, don't add them.
               if SEtoint(Ptr.Suc) = SEtoint(Successor) then
                  dupe := True;
                  Put_Line(f2, "Ignoring duplicate relation.");
               end if;
               Ptr := Ptr.Next;
            end loop;
            
            if dupe = False then  --only add unique relations.                
               SortStructure(SEtoint(Successor)).Count := SortStructure(SEtoint(Successor)).Count + 1;
               Ptr := new Node'(Suc => Successor, Next => SortStructure(SEtoint(Precedent)).Top);
               SortStructure(SetoInt(Precedent)).Top := Ptr;
            end if;
         end loop;
         Ada.Text_IO.Close(f1); --close input file
         
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
         Put_Line(f2, "Attempting to sort");
         new_line;
         while F /= 0 loop
            IntegerIO.put(f2, F);--Perform action F Output it
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
            Put_Line(f2, "");
            Put_Line(f2, "Found a solution!");
         else
            Put_Line(f2, "");
            Put_Line(f2, "Failed to complete a solution!");
            Put_Line(f2, "Loop detected.");
            for K in 1..NA loop
               SortStructure(K).Count := 0;
            end loop;
            
            --6
            for K in 1..NA loop
               Ptr := SortStructure(K).Top;
               SortStructure(K).Top := Integer_To_Ptr(0);
               while Ptr /= Integer_To_Ptr(0) loop
                  if SortStructure(SEtoint(Ptr.Suc)).Count = 0 then --trying to test this condition in the above while loop breaks the program.
                     SortStructure(SEtoint(Ptr.Suc)).Count := K;
                  end if;
                  if Ptr /= Integer_To_Ptr(0) then --This is part of the algorithm, but this if statement will never be entered.
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
            Put_Line(f2, "Printing offending loop");
            while SortStructure(Y).Top /= Integer_To_Ptr(0) loop
               IntegerIO.put(f2, Y); 
               SortStructure(Y).Top := Integer_To_Ptr(0);
               Y := SortStructure(Y).Count;
            end loop;

         end if;
      end;
   end TopologicalSort;
end GenericTopologicalSort;


