-- =============================================================
-- Case ID: TC_PHYSICAL_LITERAL_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_PHYSICAL_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: physical_literal ::= [ abstract_literal ] unit_name
-- Case Type: Positive
-- Test Focus: Arithmetic with mixed-unit physical literals — semantic check that VHDL performs implicit unit conversion when adding quantities of different scales
-- Expected Result: Compiles and simulates correctly (10 mA + 5000 uA = 15 mA)
-- Dependencies: None
-- =============================================================
entity phys_lit_sem1 is
  port(
    total_out : out integer
  );
end entity;

architecture semantic_unit_conv of phys_lit_sem1 is
  type t_current is range 0 to 1000000 units
    nA;
    uA = 1000 nA;
    mA = 1000 uA;
    A  = 1000 mA;
  end units;
  signal i1 : t_current := 10 mA;
  signal i2 : t_current := 5000 uA;
  signal i_total : t_current := 0 nA;
begin
  i_total <= i1 + i2;  -- semantic: 10 mA + 5000 uA = 15 mA
  total_out <= integer(i_total / uA);
end architecture;
