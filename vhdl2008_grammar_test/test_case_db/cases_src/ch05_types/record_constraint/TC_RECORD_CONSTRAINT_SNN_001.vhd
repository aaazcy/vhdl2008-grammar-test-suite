-- =============================================================
-- Case ID: TC_RECORD_CONSTRAINT_SNN_001
-- Rule Type: Syntax (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_constraint ::= ( record_element_constraint { , record_element_constraint } )
-- Test Focus: Missing opening parenthesis in record_constraint.
--   The BNF requires the leading '(' token; a bare element
--   constraint without parentheses is invalid.
-- Expected Result: VHDL syntax error: expected '('
-- Dependencies: None
-- =============================================================
entity record_constraint_missing_paren is
end entity record_constraint_missing_paren;

architecture no_open_paren of record_constraint_missing_paren is
  type t_rec is record
    field : integer;
  end record;
  -- ERROR: missing opening parenthesis before element constraint
  signal s : t_rec field => 42);
begin
end architecture no_open_paren;
