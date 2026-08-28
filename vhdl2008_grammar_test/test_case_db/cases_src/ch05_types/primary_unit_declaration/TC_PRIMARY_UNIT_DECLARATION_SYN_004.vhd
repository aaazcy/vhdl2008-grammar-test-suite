-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_DECLARATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY_UNIT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: primary_unit_declaration ::= identifier ;
-- Case Type: Positive
-- Test Focus: Short alphanumeric base unit identifier 'milli_ohm' as primary
--            unit — anchors an electrical resistance physical type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity resistance_bridge is
  port (
    ohm_value : out integer
  );
end entity resistance_bridge;

architecture wheatstone of resistance_bridge is
  type t_resistance is range 0 to 100000000 units
    milli_ohm;                    -- primary_unit_declaration: alphanumeric base unit
    ohm  = 1000 milli_ohm;        -- secondary
    kohm = 1000 ohm;              -- secondary
  end units;
  signal s_r_sense : t_resistance := 0 milli_ohm;
begin
  s_r_sense <= 10000 milli_ohm after 1 ns;
  ohm_value  <= t_resistance'pos(s_r_sense);
end architecture wheatstone;
