-- =============================================================
-- Case ID: TC_SUFFIX_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUFFIX
-- Standard Reference: IEEE 1076-2008 Section 8.5
-- Production: suffix ::= simple_name | character_literal | operator_symbol | all
-- Case Type: Negative
-- Test Focus: Invalid suffix — expression used where suffix expected in selected_name; only simple_name/character_literal/operator_symbol/all are valid suffixes, not parenthesized expressions
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity suffix_snn3_ent is port(r:out integer); end entity;
architecture bh of suffix_snn3_ent is
  type t_rec is record a:integer; b:integer; end record;
  signal s_rec : t_rec := (a=>0, b=>0);
begin
  s_rec.(a) <= 5;  -- ERROR: '(a)' is not a valid suffix
  r <= s_rec.a;
end architecture bh;
