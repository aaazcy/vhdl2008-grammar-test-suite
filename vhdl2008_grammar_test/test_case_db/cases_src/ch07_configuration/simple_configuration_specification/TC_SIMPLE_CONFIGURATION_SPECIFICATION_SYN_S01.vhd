-- =============================================================
-- Case ID: TC_SIMPLE_CONFIGURATION_SPECIFICATION_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: simple_configuration_specification ::= for component_specification binding_indication [ ; ] end for [ ; ]
-- Test Focus: Production-specific — configuration specification for a comparator component using a gate-level entity_aspect, demonstrating the core "for ... use entity ... end for;" pattern with explicit end for and all trailing semicolons
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity comparator_2bit is
  port(x, y : in bit_vector(1 downto 0); equal : out bit);
end entity comparator_2bit;

architecture gate of comparator_2bit is
begin
end architecture gate;


entity scs_syn_s01_ent is
  port(a, b : in bit_vector(1 downto 0); eq : out bit);
end entity scs_syn_s01_ent;

architecture struct of scs_syn_s01_ent is
  component comparator_2bit is
    port(x, y : in bit_vector(1 downto 0); equal : out bit);
  end component comparator_2bit;
  for u_cmp : comparator_2bit use entity work.comparator_2bit(gate)
    port map(x => a, y => b, equal => eq);
  end for;
begin
  u_cmp : comparator_2bit port map(x => a, y => b, equal => eq);
end architecture struct;
