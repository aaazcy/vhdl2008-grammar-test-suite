-- =============================================================
-- Case ID: TC_RETURN_STATEMENT_SNN_S01
-- Rule Type: Syntax
-- BNF Production: RETURN_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6
-- Test Focus: return_statement: function return with no expression
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity rs_e is port(r:out integer); end entity;
architecture bh of rs_e is
  function f_bad(x:integer) return integer is
  begin
    return;  -- ERROR: return without expression in function
  end function;
begin r<=f_bad(5); end architecture;
