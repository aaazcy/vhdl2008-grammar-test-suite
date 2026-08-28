-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_DECLARATION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY_UNIT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: primary_unit_declaration ::= identifier ;
-- Case Type: Negative
-- Test Focus: Syntax error -- primary unit declaration with digit as first character of identifier
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity pud_snn_digit is end entity;
architecture rtl of pud_snn_digit is
  type t_bad is range 0 to 1000 units
    1Hz;  -- ERROR: identifier cannot start with digit
  end units;
begin
end architecture rtl;
