-- =============================================================
-- Case ID: TC_FUNCTION_SPECIFICATION_SNN_S01
-- Rule Type: Syntax
-- BNF Production: FUNCTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Test Focus: function_specification: missing return type
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity fs_e is end entity;
architecture bh of fs_e is
  function f_bad(x:integer)  -- ERROR: missing return type_mark
  begin return 0; end function;
begin r<=0; end architecture;
