-- =============================================================
-- Case ID: TC_RECORD_CONSTRAINT_SNN_004
-- Rule Type: Syntax (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_constraint ::= ( record_element_constraint { , record_element_constraint } )
-- Test Focus: Uses semicolon as separator instead of comma between
--   element constraints. The BNF requires comma ({ , ...}); semicolon
--   in this position is a syntax error.
-- Expected Result: VHDL syntax error: expected ',' not ';'
-- Dependencies: None
-- =============================================================
entity record_constraint_semicolon_sep is
end entity record_constraint_semicolon_sep;

architecture bad_separator of record_constraint_semicolon_sep is
  type t_rec is record
    a : integer;
    b : bit;
  end record;
  -- ERROR: semicolon should be comma between element constraints
  subtype t_sub is t_rec(a => 1; b => '0');
  signal s : t_sub;
begin
end architecture bad_separator;
