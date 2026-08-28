-- =============================================================
-- Case ID: TC_SUBPROGRAM_STATEMENT_PART_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: subprogram_statement_part ::= { sequential_statement }
-- Case Type: Positive
-- Test Focus: subprogram_statement_part with multiple statements if-else+return: function body contains an if-else branch + return, verifies the two-statement sequence in statement_part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ssp_if_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of ssp_if_ent is
  function f_max(x,y:integer) return integer is
  begin
    if x>y then return x; else return y; end if;
  end function;
begin
  y<=f_max(a,b);
end architecture bh;
