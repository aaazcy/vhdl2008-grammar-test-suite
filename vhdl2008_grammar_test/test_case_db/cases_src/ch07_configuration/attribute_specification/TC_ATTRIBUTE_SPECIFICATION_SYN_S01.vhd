-- =============================================================
-- Case ID: TC_ATTRIBUTE_SPECIFICATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ATTRIBUTE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Test Focus: Attribute specification: attribute identifier of entity_specification is expression; — attribute value on entities, signals, labels
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_attribute_specification_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_attribute_specification_syn_s01 is
  attribute syn_attr:string;
  attribute syn_attr of drive_p : label is "arch_test";
  signal s_as:integer:=0;
begin
  drive_p : process is
  begin
    s_as<=1; r<=s_as;
    wait;
  end process;
end architecture bh;
