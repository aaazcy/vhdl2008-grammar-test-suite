-- =============================================================
-- Case ID: TC_PHYSICAL_TYPE_DEFINITION_SMN_003
-- Rule Type: Static Model
-- Related Rule ID: BNF_PHYSICAL_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: physical_type_definition ::= range_constraint units primary_unit_declaration { secondary_unit_declaration } end units
-- Case Type: Negative
-- Test Focus: Static model negative -- physical type value exceeding range constraint
-- Expected Result: Triggers bounds error
-- Dependencies: None
-- =============================================================
entity ptd_smn_bounds is port(dout:out integer); end entity;
architecture rtl of ptd_smn_bounds is
  type t_f is range 0 to 1000 units Hz; kHz=1000 Hz; end units;
  signal s:t_f:=2000 Hz;  -- ERROR: 2000 exceeds 0..1000 range
begin
  dout<=0;
end architecture rtl;
