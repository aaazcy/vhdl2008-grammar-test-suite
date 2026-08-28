-- =============================================================
-- Case ID: TC_CONTEXT_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: CONTEXT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Test Focus: Context declaration: context identifier is context_clause end [context] [identifier]; — VHDL 2008 context unit
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_context_declaration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_context_declaration_syn_s01 is
begin
  r<=42;end architecture bh;
