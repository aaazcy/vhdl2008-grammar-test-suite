-- =============================================================
-- Case ID: TC_SUBPROGRAM_HEADER_SYN_S01
-- Rule Type: Syntax
-- BNF Production: SUBPROGRAM_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Test Focus: Subprogram header: [generic_clause [generic_map_aspect;]] — VHDL 2008 generic subprograms
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_subprogram_header_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_subprogram_header_syn_s01 is
begin
  r<=42;end architecture bh;
