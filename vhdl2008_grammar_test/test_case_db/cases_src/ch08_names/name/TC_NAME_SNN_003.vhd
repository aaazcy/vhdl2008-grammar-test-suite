-- =============================================================
-- Case ID: TC_NAME_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.1
-- Production: name ::= simple_name | operator_symbol | character_literal | selected_name | indexed_name | slice_name | attribute_name | external_name
-- Case Type: Negative
-- Test Focus: Dangling dot in name — '.' without preceding prefix is not a valid selected_name; a name cannot start with a dot
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity name_snn3_ent is port(r:out integer); end entity;
architecture bh of name_snn3_ent is
  signal s_rec : integer := 0;
begin
  r <= .field;  -- ERROR: dangling dot, not a valid name form
end architecture bh;
