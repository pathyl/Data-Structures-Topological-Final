package body MyIO is

   function MyGet(Job: out Integer) return integer is
      package IntegerIO is new Ada.Text_IO.Integer_IO(Integer);
   begin
      IntegerIO.Get(Job);
      return Job;
   end MyGet;

   procedure MyPut(Job: in Integer) is
      package IntegerIO is new Ada.Text_IO.Integer_IO(Integer);
   begin
      IntegerIO.Put(Job);
   end MyPut;
end MyIO;
