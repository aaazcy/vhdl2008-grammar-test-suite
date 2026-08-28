-- =============================================================
-- Case ID: TC_PHYSICAL_TYPE_DEFINITION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PHYSICAL_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: physical_type_definition ::= range_constraint units primary_unit_declaration { secondary_unit_declaration } end units
-- Case Type: Positive
-- Test Focus: physical type for voltage with uV, mV, V, kV chain
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ptd_syn_voltage is port(dout:out integer); end entity;
architecture rtl of ptd_syn_voltage is
  type t_volt is range 0 to 1000000 units
    uV; mV=1000 uV; V=1000 mV; kV=1000 V;
  end units;
  signal s:t_volt:=5 V;
begin
  s<=3 V; dout<=0;
end architecture rtl;
