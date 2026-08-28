-- =============================================================
-- Case ID: TC_CONTEXT_CLAUSE_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_clause ::= { context_item }
-- Case Type: Positive
-- Test Focus: single context_item (library_clause): only library ieee; — verifying context_clause contains exactly one context_item of library_clause type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;

entity cc_lib_only is
  port (
    a : in  bit;
    y : out bit
  );
end entity cc_lib_only;

architecture rtl of cc_lib_only is
begin
  y <= a;
end architecture rtl;
