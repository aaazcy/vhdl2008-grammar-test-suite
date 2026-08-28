-- =============================================================
-- Case ID: TC_SECONDARY_UNIT_DECLARATION_SMN_001
-- Rule Type: Static Model
-- Related Rule ID: BNF_SECONDARY_UNIT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: secondary_unit_declaration ::= identifier = physical_literal ;
-- Case Type: Negative
-- Test Focus: static model negative -- secondary_unit name reused as primary unit identifier
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity sud_smn_duplicate is port(dout:out integer); end entity;
architecture rtl of sud_smn_duplicate is
  type t_bad is range 0 to 1000 units m; mm=1 m; m=1000 mm; end units;  -- ERROR: 'm' redeclared
begin dout<=0; end architecture;