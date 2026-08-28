-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_PRIMARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: (Physical type) primary_unit ::= the base measurement unit name in a physical type
-- Case Type: Positive
-- Test Focus: Semantic: dividing a physical quantity by its primary unit yields the abstract numeric count of primary units — semantic check that the result type is a universal integer
-- Expected Result: Compiles and simulates correctly
-- Dependencies: None
-- =============================================================
entity prim_unit_sem1 is
  port(
    raw_count : out integer;
    conv_mA   : out integer
  );
end entity;

architecture semantic_division of prim_unit_sem1 is
  type t_current is range 0 to 1000000 units
    nA;
    uA = 1000 nA;
    mA = 1000 uA;
  end units;
  signal i_measured : t_current := 2500 uA;
  signal i_nA_count : integer := 0;
begin
  -- Division by primary unit returns abstract integer (number of base units)
  i_nA_count <= i_measured / nA;
  raw_count <= i_nA_count;
  conv_mA   <= integer(i_measured / mA);
end architecture;
