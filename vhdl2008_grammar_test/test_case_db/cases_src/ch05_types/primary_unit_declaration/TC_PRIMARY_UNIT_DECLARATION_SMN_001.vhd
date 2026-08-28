-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_DECLARATION_SMN_001
-- Rule Type: Static Model
-- Related Rule ID: BNF_PRIMARY_UNIT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: primary_unit_declaration ::= identifier ;
-- Case Type: Negative
-- Test Focus: Static model negative -- primary unit identifier reused as secondary unit name
-- Expected Result: Triggers duplicate declaration error
-- Dependencies: None
-- =============================================================
entity pud_smn_dup is port(dout:out integer); end entity;
architecture rtl of pud_smn_dup is
  type t_bad is range 0 to 1000 units
    m; m=1000 m;  -- ERROR: 'm' redeclared as secondary unit
  end units;
begin
  dout<=0;
end architecture rtl;
