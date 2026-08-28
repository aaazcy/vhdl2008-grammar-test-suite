-- =============================================================
-- Case ID: TC_ARRAY_CONSTRAINT_SMN_001
-- Rule Type: Semantic (Negative)
-- Related Rule ID: BNF_ARRAY_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_constraint ::= index_constraint [ array_element_constraint ] | ( open ) [ array_element_constraint ]
-- Case Type: Negative
-- Test Focus: Array constraint with bounds outside base type range — natural has lower bound 0, but constraint uses -4 which violates the base index subtype
-- Expected Result: Triggers semantic error (constraint bound outside base type range)
-- Dependencies: None
-- =============================================================
entity array_ctr_smn1 is
  port(clk : in bit; val : out integer);
end entity;
architecture bh of array_ctr_smn1 is
  type t_arr is array (natural range <>) of integer;
  -- Natural base subtype lower bound is 0, but constraint starts at -4 — semantic violation
  subtype t_bad is t_arr(-4 to 7);
  signal s : t_bad;
begin
  s(-4) <= 1;
  val <= s(-4);
end architecture bh;
