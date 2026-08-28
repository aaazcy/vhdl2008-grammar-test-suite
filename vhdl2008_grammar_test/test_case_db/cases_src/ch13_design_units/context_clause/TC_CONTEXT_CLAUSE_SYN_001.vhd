-- =============================================================
-- Case ID: TC_CONTEXT_CLAUSE_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_clause ::= { context_item }
-- Case Type: Positive
-- Test Focus: minimal empty context_clause: no library/use/context statement before the design unit — verifying { context_item } may repeat zero times and context_clause may be empty
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cc_empty is
  port (
    a : in  bit;
    y : out bit
  );
end entity cc_empty;

architecture rtl of cc_empty is
begin
  y <= a;
end architecture rtl;
