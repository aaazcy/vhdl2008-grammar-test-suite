-- =============================================================
-- Case ID: TC_SCALAR_TYPE_DEFINITION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SCALAR_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: scalar_type_definition ::= enumeration_type_definition | integer_type_definition | floating_type_definition | physical_type_definition
-- Case Type: Positive
-- Test Focus: scalar_type_definition as physical type with units
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity std_syn_phys is port(dout:out integer); end entity;
architecture rtl of std_syn_phys is
  type t_freq is range 0 to 1000000 units Hz; kHz=1000 Hz; MHz=1000 kHz; end units;
  signal s:t_freq:=1 kHz;
begin s<=1 MHz; dout<=0; end architecture;