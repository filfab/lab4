with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Primes; use Primes;

procedure Main is
   command : String (1..2);
   parameter : Positive;
begin
   if Argument_Count = 0 then
      Put_Line("// COMMANDS : pn | pr | ip");
      Put("<< command: ");
      Get(command);
      Get(parameter);
   elsif Argument_Count = 2 then
      command := Argument(1);
      parameter := Positive'Value(Argument(2));
   else
      Put_Line("Incorrect number of arguments (expected: 2 got:"& Argument_Count'Image &")");
      return;
   end if;

   if command = "pn" then
      Put_Line(">>"& PrimeNumbers(parameter)'Image);
   elsif command = "pr" then
      Put_Line(">>"& Prime(parameter)'Image);
   elsif command = "ip" then
      Put_Line(">> "& IsPrime(parameter)'Image);
   else
      Put_Line(">> Unknown command");
   end if;
end Main;