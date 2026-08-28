-- =============================================================
-- Case ID: TC_SCALAR_TYPE_DEFINITION_SMN_002
-- Rule Type: Static Model
-- Related Rule ID: BNF_SCALAR_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: scalar_type_definition ::= enumeration_type_definition | integer_type_definition | floating_type_definition | physical_type_definition
-- Case Type: Negative
-- Test Focus: static model negative -- physical type unit mismatch in comparison
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity std_smn_unit_err is port(dout:out integer); end entity;
architecture rtl of std_smn_unit_err is
  type t_f is range 0 to 1000 units kHz; MHz=1000 kHz; end units;
  type t_d is range 0 to 1000 units mm; cm=10 mm; end units;
  signal sf:t_f:=1 kHz;
  signal sd:t_d:=1 mm;
begin process begin if sf>sd then dout<=1; end if; wait; end process;  -- ERROR: different physical types
end architecture;