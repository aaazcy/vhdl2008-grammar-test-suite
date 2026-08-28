-- =============================================================
-- Case ID: TC_PHYSICAL_LITERAL_SNN_001
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_PHYSICAL_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: physical_literal ::= [ abstract_literal ] unit_name
-- Case Type: Negative
-- Test Focus: Unit name from wrong type — using 'ns' (time unit) where a custom physical type unit is expected; the unit_name must belong to the type of the target
-- Expected Result: Triggers type error (unit from different physical type)
-- Dependencies: None
-- =============================================================
entity phys_lit_e1 is
  port(clk : in bit; val : out integer);
end entity;
architecture bh of phys_lit_e1 is
  type t_distance is range 0 to 1000000 units
    um;
    mm = 1000 um;
    m  = 1000 mm;
  end units;
  -- ERROR: 'ns' is a time unit, not a t_distance unit
  signal dist : t_distance := 10 ns;
begin
  val <= integer(dist / um);
end architecture bh;
