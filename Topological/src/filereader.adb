

package body FileReader is


   procedure ReadLines(Arr: in out MyTypeArray) is
      f1 : File_Type;
      inputFile : String := "input.txt";
      LineCount : Integer := 0;
      --Q: ParentPtr := new IntegerType'(null, -1);
      i : Integer := 1;
      J: IntegerType;
   begin
      Ada.Text_IO.Open(File => f1,
                       Mode => In_File,
                       Name => inputFile);
      
      while not End_Of_File(f1) loop
         declare
            Current_Line: String := Get_Line(f1);

            P : ParentPtr;
         begin
            P := new IntegerType'(Parent with Integer'Value(Current_Line));
            Arr(i) := P;
            i := i + 1;
         end;
      end loop;
      
      for i in 1..NumItems loop
         J := Arr(i);
         Put_Line(J.integerValue'Image);
      end loop;
      
      
   Ada.Text_IO.Close(f1);
   end ReadLines;
   
  function NumItems return Integer is
            f1 : File_Type;
      inputFile : String := "input.txt";
      LineCount : Integer := 0;
   begin
      Ada.Text_IO.Open(File => f1,
                       Mode => In_File,
                       Name => inputFile);
      
      while not End_Of_File(f1) loop
         declare
            Current_Line : String := Get_Line(f1);
         begin
            LineCount := LineCount + 1;
         end;
      end loop;
      Ada.Text_IO.Close(f1);
      return LineCount;
   end NumItems;
   
   
end FileReader;
