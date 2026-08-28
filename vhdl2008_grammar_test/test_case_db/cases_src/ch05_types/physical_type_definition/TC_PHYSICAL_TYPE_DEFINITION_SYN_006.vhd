-- =============================================================
-- Case ID: TC_PHYSICAL_TYPE_DEFINITION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_PHYSICAL_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: physical_type_definition ::= range_constraint units primary_unit_declaration { secondary_unit_declaration } end units
-- Case Type: Positive
-- Test Focus: physical type for power with single secondary unit mW->W
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ptd_syn_power is port(dout:out integer); end entity;
architecture rtl of ptd_syn_power is
  type t_pwr is range 0 to 1000000 units
    mW; W=1000 mW;
  end units;
  signal s:t_pwr:=1 W;
begin
  s<=500 mW; dout<=0;
end architecture rtl;
