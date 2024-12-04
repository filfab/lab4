with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

package body Primes is
   
   function PrimeNumbers (n : Positive) return Positive is
   begin
      return 1;
   end PrimeNumbers;

   function Prime (n : Positive) return Positive is
      type PrimesArr is array(Positive range 1..n) of Positive;

      suspected : Positive := 3;
      sus_is_prime : Boolean;
      counter : Positive := 1;
      primes : PrimesArr; 
   begin
      primes(1) := 2;
      while counter < n loop
         sus_is_prime := True;
         for i in 2..counter loop
               if suspected mod primes(i) = 0 then
                  sus_is_prime := False;
                  exit;
               end if;
         end loop;
         if sus_is_prime then
               primes(counter+1) := suspected;
               counter := counter + 1;
         end if;
         suspected := suspected + 2;
      end loop;
      return primes(n);
   end Prime;

   function IsPrime (n : Positive) return Boolean is
      i, k : Natural;
   begin
      if n=2 or n=3 or n=5 then
            return True;
      elsif (n = 1) or (n mod 2 = 0) or (n mod 3 = 0) or (n mod 5 = 0) then
            return False;
      else
         i := 6;
         k := Natural(Sqrt(Float(n)));
         while i <= k loop
               if (n mod (i+1) = 0) or (n mod (i+5) = 0) then
                  return False;
               end if;
               i := i + 6;
         end loop;
         return True;
      end if;
   end IsPrime;

end Primes;
