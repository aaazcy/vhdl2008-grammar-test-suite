-- =============================================================
-- Case ID: TC_ARRAY_CONSTRAINT_SNN_004
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_ARRAY_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_constraint ::= index_constraint [ array_element_constraint ] | ( open ) [ array_element_constraint ]
-- Case Type: Negative
-- Test Focus: Wrong number of index constraints — type has 1 dimension but constraint provides 2; violates the correspondence between type dimensionality and index_constraint list
-- Expected Result: Triggers type mismatch error
-- Dependencies: None
-- =============================================================
entity array_ctr_e4 is
  port(clk : in bit; val : out integer);
end entity;
architecture bh of array_ctr_e4 is
  type t_arr1d is array (natural range <>) of integer;
  -- ERROR: 1D type but index_constraint provides 2 discrete_range entries
  subtype t_bad is t_arr1d(0 to 7, 0 to 3);
  signal s : t_bad;
begin
  val <= 0;
end architecture bh;
