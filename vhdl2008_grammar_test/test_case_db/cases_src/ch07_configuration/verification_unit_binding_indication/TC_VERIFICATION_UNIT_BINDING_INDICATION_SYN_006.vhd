-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_BINDING_INDICATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_VERIFICATION_UNIT_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_binding_indication ::= use vunit verification_unit_list
-- Case Type: Positive
-- Test Focus: five comma-separated VUnit names — a single verification_unit_binding_indication lists five verification unit names separated by commas, verifies verification_unit_list can be extended to contain multiple comma-separated verification unit names to cover complex verification scenarios
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity logic_block is
  port (x1, x2, x3 : in bit; z : out bit);
end entity logic_block;

architecture rtl of logic_block is
begin
end architecture rtl;

entity vubi_syn6_ent is
  port(a, b, c : in bit; y : out bit);
end entity vubi_syn6_ent;

architecture rtl of vubi_syn6_ent is
  component logic_block is
    port(x1, x2, x3 : in bit; z : out bit);
  end component logic_block;
  for u_lb : logic_block use entity work.logic_block(rtl)
    port map(x1 => a, x2 => b, x3 => c, z => y);
    use vunit lb_cov, lb_assert, lb_timing, lb_stim, lb_monitor;
  end for;
begin
  u_lb : logic_block port map(x1 => a, x2 => b, x3 => c, z => y);
end architecture rtl;
