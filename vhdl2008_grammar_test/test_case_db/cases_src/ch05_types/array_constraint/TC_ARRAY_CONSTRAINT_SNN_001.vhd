-- =============================================================
-- Case ID: TC_ARRAY_CONSTRAINT_SNN_001
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_ARRAY_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_constraint ::= index_constraint [ array_element_constraint ] | ( open ) [ array_element_constraint ]
-- Case Type: Negative
-- Test Focus: Missing closing parenthesis in index_constraint — the BNF requires balanced parentheses; this tests detection of malformed (open) form
-- Expected Result: Triggers syntax error (unmatched parenthesis)
-- Dependencies: None
-- =============================================================
entity array_ctr_e1 is
  port(clk : in bit; val : out integer);
end entity;
architecture bh of array_ctr_e1 is
  type t_arr is array (natural range <>) of integer;
  -- ERROR: missing closing parenthesis in array constraint
  subtype t_bad is t_arr(0 to 7;
  signal s : t_bad;
begin
  s(0) <= 1;
end architecture bh;
