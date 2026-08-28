-- =============================================================
-- Case ID: TC_PHYSICAL_TYPE_DEFINITION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_PHYSICAL_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: physical_type_definition ::= range_constraint units primary_unit_declaration { secondary_unit_declaration } end units
-- Case Type: Positive
-- Test Focus: SEMANTIC -- physical type unit conversion at expression evaluation
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ptd_sem_convert is port(dout:out integer); end entity;
architecture rtl of ptd_sem_convert is
  type t_freq is range 0 to 1000000000 units
    Hz; kHz=1000 Hz; MHz=1000 kHz;
  end units;
  signal s:t_freq:=1 MHz; signal r:integer:=0;
begin
  process begin
    r<=s / 1 kHz; dout<=r; wait;
  end process;
end architecture rtl;
