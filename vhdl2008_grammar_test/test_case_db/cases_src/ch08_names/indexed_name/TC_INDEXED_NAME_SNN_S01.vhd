-- =============================================================
-- Case ID: TC_INDEXED_NAME_SNN_S01
-- Rule Type: Syntax
-- BNF Production: INDEXED_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.4
-- Test Focus: indexed_name: missing closing paren in index
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity in_e is port(r:out integer); end entity;
architecture bh of in_e is
  type t_arr is array(0 to 7) of integer; signal s:t_arr;
begin
  s(0<=1;  -- ERROR: missing ) after index
  r<=s(0);
end architecture;
