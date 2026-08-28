-- =============================================================
-- Case ID: TC_PREFIX_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PREFIX
-- Standard Reference: IEEE 1076-2008 Section 8.3
-- Production: prefix ::= name | function_call
-- Case Type: Negative
-- Test Focus: Invalid prefix — aggregate used where prefix expected; an aggregate is not a valid prefix as it is neither a name nor a function_call
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity prefix_snn3_ent is port(r:out integer); end entity;
architecture bh of prefix_snn3_ent is
  signal s : integer := 0;
begin
  r <= (s, s)(0);  -- ERROR: aggregate cannot be used as prefix
end architecture bh;
