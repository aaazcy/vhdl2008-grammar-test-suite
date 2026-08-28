-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_DECLARATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY_UNIT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: primary_unit_declaration ::= identifier ;
-- Case Type: Negative
-- Test Focus: Syntax error -- primary unit missing semicolon after identifier
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity pud_snn_no_semi is end entity;
architecture rtl of pud_snn_no_semi is
  type t_bad is range 0 to 1000 units
    Hz kHz=1000 Hz;  -- ERROR: missing ';' after primary unit 'Hz'
  end units;
begin
end architecture rtl;
