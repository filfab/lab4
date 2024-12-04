package Primes is
   pragma Preelaborate;

   function PrimeNumbers (n : Positive) return Positive;
   function Prime (n : Positive) return Positive;
   function IsPrime (n : Positive) return Boolean;
private
end Primes;