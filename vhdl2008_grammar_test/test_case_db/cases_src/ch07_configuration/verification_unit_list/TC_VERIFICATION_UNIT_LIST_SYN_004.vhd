-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_LIST_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_VERIFICATION_UNIT_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_list ::= verification_unit_name { , verification_unit_name }
-- Case Type: Positive
-- Test Focus: five comma-separated verification unit names using the underscore naming convention — verification_unit_list contains five verification unit names with long underscore-separated identifiers, tests the parsing capability of the comma-separated list with identifiers in a complex naming style
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity d_flipflop is
  port (clk, rst, d : in bit; q : out bit);
end entity d_flipflop;

architecture beh of d_flipflop is
begin
end architecture beh;

entity vul_syn4_ent is
  port(clk, rst : in bit; d : in bit; q : out bit);
end entity vul_syn4_ent;

architecture rtl of vul_syn4_ent is
  component d_flipflop is
    port(clk, rst, d : in bit; q : out bit);
  end component d_flipflop;
  for u_ff : d_flipflop use entity work.d_flipflop(beh)
    port map(clk => clk, rst => rst, d => d, q => q);
    use vunit ff_setup_check, ff_hold_validation, ff_reset_coverage, ff_toggle_monitor, ff_delay_assertion;
  end for;
begin
  u_ff : d_flipflop port map(clk => clk, rst => rst, d => d, q => q);
end architecture rtl;
