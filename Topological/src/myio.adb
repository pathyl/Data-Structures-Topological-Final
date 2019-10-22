--in file myio.adb
package body MyIO is

   procedure MyPut(file: File_Type; Job: in Integer) is
      package IntegerIO is new Ada.Text_IO.Integer_IO(Integer);
   begin
      IntegerIO.Put(file, Job);
   end MyPut;

   procedure GetJobs(Precedent, Successor: out Integer; Current_Line: String) is
   begin
      --Relations should be in the form J<K on each new line.
      Precedent := Integer'Value(Current_Line(1..1));
      Successor := Integer'Value(Current_Line(3..3));
   end getJobs;

end MyIO;
