-- =============================================================
-- Case ID: TC_SUFFIX_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUFFIX
-- Standard Reference: IEEE 1076-2008 Section 8.5
-- Production: suffix ::= simple_name | character_literal | operator_symbol | all
-- Case Type: Negative
-- Test Focus: Invalid suffix — integer literal used where suffix is expected in a selected_name context; suffix must be a simple_name, character_literal, operator_symbol, or 'all', not a numeric literal
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity suffix_snn2_ent is port(r:out integer); end entity;
architecture bh of suffix_snn2_ent is
  type t_rec is record f1:integer; f2:integer; end record;
  signal s_rec : t_rec := (f1=>0, f2=>0);
begin
  s_rec.1 <= 5;  -- ERROR: '1' is decimal literal, not a valid suffix
  r <= s_rec.f1;
end architecture bh;
