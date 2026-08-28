-- =============================================================
-- Case ID: TC_CONTEXT_REFERENCE_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_REFERENCE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_reference ::= context selected_name { , selected_name } ;
-- Case Type: Negative
-- Test Focus: no selected_name after trailing comma in context_reference: context work.a_ctx, ; — a selected_name must follow the comma separator; the empty list element triggers a syntax error
-- Expected Result: Triggers syntax error: expected selected_name after comma in context_reference
-- Dependencies: None
-- =============================================================
library ieee;
context work.type_ctx, ;

entity cr_trailing_comma is
  port (
    y : out bit
  );
end entity cr_trailing_comma;

architecture rtl of cr_trailing_comma is
begin
  y <= '0';
end architecture rtl;
