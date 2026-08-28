-- =============================================================
-- Case ID: TC_NAME_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.1
-- Production: name ::= simple_name | operator_symbol | character_literal | selected_name | indexed_name | slice_name | attribute_name | external_name
-- Case Type: Negative
-- Test Focus: Literal used where name expected — a numeric literal (42) cannot serve as a name; name must be one of the 8 defined name forms, not a literal value
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity name_snn2_ent is port(r:out integer); end entity;
architecture bh of name_snn2_ent is
  signal s : integer := 0;
begin
  42 <= s;  -- ERROR: literal is not a valid name, cannot be target of assignment
  r <= s;
end architecture bh;
