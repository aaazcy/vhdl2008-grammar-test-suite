-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_BINDING_INDICATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_VERIFICATION_UNIT_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_binding_indication ::= use vunit verification_unit_list
-- Case Type: Positive
-- Test Focus: VUnit binding applied to the "all" instantiation list — component_specification uses the "all" keyword to cover all component instances, verification_unit_binding_indication applies to all instances as well, verifies the syntax correctness of VUnit binding in batch component configuration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity flipflop is
  port (clk, d : in bit; q : out bit);
end entity flipflop;

architecture rtl of flipflop is
begin
end architecture rtl;

entity vubi_syn5_ent is
  port(clk : in bit; d0, d1 : in bit; q0, q1 : out bit);
end entity vubi_syn5_ent;

architecture rtl of vubi_syn5_ent is
  component flipflop is
    port(clk, d : in bit; q : out bit);
  end component flipflop;
  for all : flipflop use entity work.flipflop(rtl)
    port map(clk => clk, d => d, q => q);
    use vunit ff_state_coverage;
  end for;
  signal s_d0, s_d1 : bit;
begin
  s_d0 <= d0; s_d1 <= d1;
  u_ff0 : flipflop port map(clk => clk, d => s_d0, q => q0);
  u_ff1 : flipflop port map(clk => clk, d => s_d1, q => q1);
end architecture rtl;
