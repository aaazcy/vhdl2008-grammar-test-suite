-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_LIST_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_VERIFICATION_UNIT_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_list ::= verification_unit_name { , verification_unit_name }
-- Case Type: Positive
-- Test Focus: single-element verification_unit_list used in a "for all" instantiation context — a verification_unit_list containing only one verification unit name used in the "for all" component_specification, verifies the syntax correctness of a single-element list in the batch component binding scenario
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity latch_d is
  port (clk, d : in bit; q : out bit);
end entity latch_d;

architecture rtl of latch_d is
begin
end architecture rtl;

entity vul_syn6_ent is
  port(clk : in bit; d0, d1 : in bit; q0, q1 : out bit);
end entity vul_syn6_ent;

architecture rtl of vul_syn6_ent is
  component latch_d is
    port(clk, d : in bit; q : out bit);
  end component latch_d;
  for all : latch_d use entity work.latch_d(rtl)
    port map(clk => clk, d => d, q => q);
    use vunit latch_transparency_check;
  end for;
begin
  u_l0 : latch_d port map(clk => clk, d => d0, q => q0);
  u_l1 : latch_d port map(clk => clk, d => d1, q => q1);
end architecture rtl;
