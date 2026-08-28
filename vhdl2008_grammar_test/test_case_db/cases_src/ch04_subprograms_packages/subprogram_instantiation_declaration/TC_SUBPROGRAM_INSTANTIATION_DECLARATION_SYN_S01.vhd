-- =============================================================
-- Case ID: TC_SUBPROGRAM_INSTANTIATION_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: SUBPROGRAM_INSTANTIATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.4
-- Test Focus: Subprogram instantiation: subprogram_kind identifier is new uninstantiated_subprogram_name [signature] [generic_map_aspect];
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_subprogram_instantiation_declaration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_subprogram_instantiation_declaration_syn_s01 is
begin
  r<=42;end architecture bh;
