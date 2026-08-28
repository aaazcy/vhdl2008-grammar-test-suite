-- =============================================================
-- Case ID: TC_CONDITION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: condition ::= expression
-- Case Type: Positive
-- Test Focus: condition: boolean function call result used as if-statement condition
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity condition_syn5_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of condition_syn5_ent is
  function f_is_positive(x:integer) return boolean is
  begin return x>0; end function;
begin
  process(a,b) is
  begin
    if f_is_positive(a-b) then y<=a; else y<=b; end if;
  end process;
end architecture bh;
