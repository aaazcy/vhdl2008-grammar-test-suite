-- =============================================================
-- Case ID: TC_RETURN_STATEMENT_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_RETURN_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.13
-- Production: return_statement ::= [ label : ] return [ expression ] ;
-- Case Type: Positive (Production-Specific)
-- Test Focus: Production-specific: multiple returns in a recursive function — the factorial function has a return in each conditional branch, verifying the use of return in a multi-branch recursive function
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity return_factorial_ent is
  port (
    n     : in  integer range 0 to 12;
    fact  : out integer range 1 to 479001600
  );
end entity return_factorial_ent;

architecture math of return_factorial_ent is
  function factorial(k : integer) return integer is
  begin
    if k <= 1 then
      return 1;
    end if;
    return k * factorial(k - 1);
  end function;
begin
  process(n) is
  begin
    fact <= factorial(n);
  end process;
end architecture math;
