-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_BINDING_INDICATION_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_VERIFICATION_UNIT_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_binding_indication ::= use vunit verification_unit_list
-- Test Focus: Production-specific — minimal verification unit binding with a single VUnit name "protocol_validator" targeting a simple buffer component, demonstrating the core "use vunit" binding pattern as it would appear in a practical verification context
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity buffer_gate is
  port (d : in bit; q : out bit);
end entity buffer_gate;

architecture beh of buffer_gate is
begin
end architecture beh;

entity vubi_syn_s01_ent is
  port(din : in bit; dout : out bit);
end entity vubi_syn_s01_ent;

architecture struct of vubi_syn_s01_ent is
  component buffer_gate is
    port(d : in bit; q : out bit);
  end component buffer_gate;
  for u_buf : buffer_gate use entity work.buffer_gate(beh);
    use vunit protocol_validator;
  end for;
begin
  u_buf : buffer_gate port map(d => din, q => dout);
end architecture struct;
