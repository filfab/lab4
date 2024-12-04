with Ada.Text_IO; use Ada.Text_IO;

package body TotientLib is

   function Totient (n : Positive) return Positive is
      factors : FactorList := Factorise(n);
      f : Factor;
      base, exponent : Positive;
      ans : Positive := 1;
   begin
      if n /= 1 then
         while not IsEmpty(factors) loop
            f := Pop(factors);
            base := f.base;
            exponent := f.exponent;
            ans := ans * (base - 1);
            for i in 1..(exponent-1) loop
               ans := ans * base;
            end loop;
         end loop;
      end if;
      return ans;
   end Totient;

   function Factorise (n : Positive) return FactorList is
      function Count (n : in out Positive; f : Positive) return Natural is
         counter : Natural;
      begin
         counter := 0;
         while n mod f = 0 loop
               counter := counter + 1;
               n := n / f;
         end loop;
         return counter;
      end count;

      number : Positive := n;
      factors : FactorList;
      base : Positive := 2;
      exponent : Natural := Count(number, base);
      f : Factor;
   begin
      if exponent > 0 then
         Init(f, base, exponent);
         Push(factors, f);
      end if;

      base := 3;
      while number > 1 loop
         exponent := Count(number, base);
         if exponent > 0 then
               Init(f, base, exponent);
               Push(factors, f);
         end if;
         base := base + 2;
      end loop;
      return factors;
   end Factorise;


--/// Factor related functions ///
   procedure Init (X : out Factor; b, e : Positive) is
   begin
      X.base := b;
      X.exponent := e;
   end Init;

   function Repr (X : Factor) return String is
   begin
      return Trim(X.base'Image, Ada.Strings.Left)&"^"&Trim(X.exponent'Image, Ada.Strings.Left);
   end Repr;

end TotientLib;
