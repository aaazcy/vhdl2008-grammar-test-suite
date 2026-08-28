-- =============================================================
-- Case ID: TC_RETURN_STATEMENT_SYN_S03
-- Rule Type: Syntax
-- Related Rule ID: BNF_RETURN_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.13
-- Production: return_statement ::= [ label : ] return [ expression ] ;
-- Case Type: Positive
-- Test Focus: multiple return paths in function
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ret_spc3_ent is port(a:in integer; r:out integer); end entity;
architecture bh of ret_spc3_ent is
  function f_abs(x:integer) return integer is begin
    if x>=0 then return x; end if;
    return -x;
  end;
begin r<=f_abs(a); end architecture bh;
