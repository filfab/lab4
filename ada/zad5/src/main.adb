with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with TotientLib; use TotientLib;

procedure Main is
   x : Positive;
begin
   if Argument_Count = 0 then
      Put_Line("No arguments given");
   else
      for i in 1..Argument_Count  loop
         x := Positive'Value(Argument(i));
         Put_Line("Totient(" & x'Image & " ) =" & Totient(x)'Image);
      end loop;
   end if;

end Main;
