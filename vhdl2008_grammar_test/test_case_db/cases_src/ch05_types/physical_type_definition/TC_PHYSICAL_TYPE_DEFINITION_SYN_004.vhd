-- =============================================================
-- Case ID: TC_PHYSICAL_TYPE_DEFINITION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PHYSICAL_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: physical_type_definition ::= range_constraint units primary_unit_declaration { secondary_unit_declaration } end units
-- Case Type: Positive
-- Test Focus: physical type for resistance with Ohm and derived units
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ptd_syn_resistance is port(dout:out integer); end entity;
architecture rtl of ptd_syn_resistance is
  type t_res is range 0 to 1000000 units
    Ohm; kOhm=1000 Ohm; MOhm=1000 kOhm;
  end units;
  signal s:t_res:=1 kOhm;
begin
  s<=10 kOhm; dout<=0;
end architecture rtl;
