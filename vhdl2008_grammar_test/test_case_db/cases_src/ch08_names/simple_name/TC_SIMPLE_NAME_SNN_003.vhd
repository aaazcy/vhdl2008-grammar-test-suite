-- =============================================================
-- Case ID: TC_SIMPLE_NAME_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.1
-- Production: simple_name ::= identifier
-- Case Type: Negative
-- Test Focus: Invalid identifier starting with digit — identifiers must start with a letter; a name starting with a digit is not a valid identifier and thus not a valid simple_name in any context
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity simple_name_snn3_ent is port(r:out integer); end entity;
architecture bh of simple_name_snn3_ent is
  signal 1bad_signal : integer := 0;  -- ERROR: identifier cannot start with digit
begin
  r <= 1bad_signal;
end architecture bh;
