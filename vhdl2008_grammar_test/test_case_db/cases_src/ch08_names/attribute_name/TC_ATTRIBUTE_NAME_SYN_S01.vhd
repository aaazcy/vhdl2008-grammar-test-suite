-- =============================================================
-- Case ID: TC_ATTRIBUTE_NAME_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ATTRIBUTE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.6
-- Test Focus: Attribute name: prefix'attribute_designator [(static_expression)] — user-defined and predefined attribute access
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_attribute_name_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_attribute_name_syn_s01 is
  type t_attr is range 0 to 255; signal s_attr:t_attr:=0;
begin
  r<=t_attr'pos(s_attr);  -- T'POS predefined attribute
end architecture bh;
