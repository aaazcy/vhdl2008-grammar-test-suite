-- =============================================================
-- Case ID: TC_ARRAY_CONSTRAINT_SNN_003
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_ARRAY_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_constraint ::= index_constraint [ array_element_constraint ] | ( open ) [ array_element_constraint ]
-- Case Type: Negative
-- Test Focus: Single-element index_constraint omitted — BNF requires ( discrete_range { , discrete_range } ); missing the discrete_range inside parentheses
-- Expected Result: Triggers syntax error (empty constraint not allowed)
-- Dependencies: None
-- =============================================================
entity array_ctr_e3 is
  port(clk : in bit; val : out integer);
end entity;
architecture bh of array_ctr_e3 is
  type t_arr is array (natural range <>) of integer;
  -- ERROR: empty parentheses not valid as array_constraint
  subtype t_bad is t_arr();
  signal s : t_bad;
begin
  val <= 0;
end architecture bh;
