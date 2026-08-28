-- =============================================================
-- Case ID: TC_CONTEXT_ITEM_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_ITEM
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_item ::= library_clause | use_clause | context_reference
-- Case Type: Positive
-- Test Focus: minimal context_item - library_clause form: library ieee; as the only context_item, verifying the minimal compilable form of library_clause as a context_item
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;

entity ci_min_lib is
  port (
    a : in  bit;
    y : out bit
  );
end entity ci_min_lib;

architecture rtl of ci_min_lib is
begin
  y <= a;
end architecture rtl;
