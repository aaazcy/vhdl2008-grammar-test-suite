-- =============================================================
-- Case ID: TC_RECORD_CONSTRAINT_SNN_002
-- Rule Type: Syntax (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_constraint ::= ( record_element_constraint { , record_element_constraint } )
-- Test Focus: Missing closing parenthesis after element constraints.
--   The BNF requires both '(' and ')'; omitting the closing
--   parenthesis is a parse error.
-- Expected Result: VHDL syntax error: expected ')' or ','
-- Dependencies: None
-- =============================================================
entity record_constraint_missing_close is
end entity record_constraint_missing_close;

architecture no_close_paren of record_constraint_missing_close is
  type t_rec is record
    x : integer;
    y : integer;
  end record;
  -- ERROR: missing closing parenthesis
  subtype t_sub is t_rec(x => 10, y => 20;
  signal s : t_sub;
begin
end architecture no_close_paren;
