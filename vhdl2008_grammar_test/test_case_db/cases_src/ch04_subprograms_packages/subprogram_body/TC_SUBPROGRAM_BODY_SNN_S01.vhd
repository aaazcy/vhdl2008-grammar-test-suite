-- =============================================================
-- Case ID: TC_SUBPROGRAM_BODY_SNN_S01
-- Rule Type: Syntax
-- BNF Production: SUBPROGRAM_BODY
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Test Focus: subprogram_body: missing "is" after specification
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity sb_e is port(r:out integer); end entity;
architecture bh of sb_e is
  function f_bad(x:integer) return integer  -- ERROR: missing "is"
  begin return x*2; end function;
begin r<=f_bad(5); end architecture;
