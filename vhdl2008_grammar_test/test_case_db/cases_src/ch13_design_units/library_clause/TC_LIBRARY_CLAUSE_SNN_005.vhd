-- =============================================================
-- Case ID: TC_LIBRARY_CLAUSE_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_LIBRARY_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: library_clause ::= library logical_name_list ;
-- Case Type: Negative
-- Test Focus: no logical_name after trailing comma in library_clause: library ieee, ; — a logical_name must follow the comma separator; the empty list element triggers a logical_name_list syntax error
-- Expected Result: Triggers syntax error: expected logical_name after comma in library_clause
-- Dependencies: None
-- =============================================================
library ieee, ;

entity lc_trail_comma is
  port (
    y : out bit
  );
end entity lc_trail_comma;

architecture rtl of lc_trail_comma is
begin
  y <= '0';
end architecture rtl;
