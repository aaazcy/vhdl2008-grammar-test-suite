-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_LIST_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_VERIFICATION_UNIT_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_list ::= verification_unit_name { , verification_unit_name }
-- Test Focus: Production-specific — three comma-separated verification unit names targeting a multiplexer component, demonstrating a practical verification unit list as it would appear in a real verification environment: coverage, assertion, and functional check
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity mux_2to1 is
  port (s : in bit; a, b : in bit; z : out bit);
end entity mux_2to1;

architecture gate of mux_2to1 is
begin
end architecture gate;

entity vul_syn_s01_ent is
  port(sel : in bit; d0, d1 : in bit; y : out bit);
end entity vul_syn_s01_ent;

architecture struct of vul_syn_s01_ent is
  component mux_2to1 is
    port(s : in bit; a, b : in bit; z : out bit);
  end component mux_2to1;
  for u_mux : mux_2to1 use entity work.mux_2to1(gate);
    use vunit mux_coverage, mux_assertion, mux_functional;
  end for;
begin
  u_mux : mux_2to1 port map(s => sel, a => d0, b => d1, z => y);
end architecture struct;
