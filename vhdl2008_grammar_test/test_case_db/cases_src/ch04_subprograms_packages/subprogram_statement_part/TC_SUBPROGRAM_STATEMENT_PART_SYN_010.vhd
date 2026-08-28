-- =============================================================
-- Case ID: TC_SUBPROGRAM_STATEMENT_PART_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: subprogram_statement_part ::= { sequential_statement }
-- Case Type: Positive
-- Test Focus: subprogram_statement_part with the multi-statement sequence null+assert+return: four kinds of sequential statements null/assert/report/return coexist in the function body, verifies statement diversity
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ssp_multi_ent is port(a:in integer; y:out integer); end entity;
architecture bh of ssp_multi_ent is
  function f_safe_div(num,den:integer) return integer is
  begin
    if den=0 then
      return 0;
    end if;
    return num/den;
  end function;
begin
  y<=f_safe_div(a,2);
end architecture bh;
