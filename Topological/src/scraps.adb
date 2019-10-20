--separate first object
               for i in Current_Line'range loop
                  if Current_Line(i) = ')' then
                     End_Of_Object := i - 1;
                  end if;
               end loop;
               
--First_Object := To_Unbounded_String(Current_Line(2..End_Of_Object));

if Current_Line(1..1) = "(" then
               --It is some type of object
               Put_Line("Found an Object");
               Put_Line(Current_Line);
               --for i in Current_Line'range loop
               --if Current_Line(i) = "," or i = Current_Line'last then
end if;


         
            --separate second object
            End_Of_Object := End_Of_Object + 1;
            --Second_Half := To_Unbounded_String(Current_Line(End_Of_Object..Current_Line'Last));
               Ada.Strings.Fixed.Move(Current_Line(End_Of_Object..Current_Line'Last), Second_Half);
            Put_Line(Second_Half);
            for i in Second_Half'range loop
               if Second_Half(i) = '(' then
                  Put_Line("Found Second Object");
               end if;
            end loop;
            



 if Which_Type = "food" then
         FoodConstructor(Object);
      elsif Which_Type = "integer" then
         IntegerConstructor(Object);
      elsif Which_Type = "person" then
         PersonConstructor(Object);
      elsif Which_Type = "car" then
         CarConstructor(Object);
      elsif Which_Type = "name" then
         NameConstructor(Object);
      end if;



      --6
      for K in 1..NA loop
         Ptr := SortStructure(K).Top;
         SortStructure(K).Top := Integer_To_Ptr(0);
         while Ptr /= Integer_To_Ptr(0) and SortStructure(SEtoint(Ptr.all.Suc)).Count = 0 loop
            SortStructure(SEtoint(Ptr.all.Suc)).Count := K;
            if Ptr /= Integer_To_Ptr(0) then
               Ptr := Ptr.Next;
            end if;
         end loop;
      end loop;
      

       while SortStructure(Y).Top /= Integer_To_Ptr(0) loop
            SortStructure(Y).Top := Integer_To_Ptr(1);
            Y := SortStructure(Y).Count;
         end loop;
         
