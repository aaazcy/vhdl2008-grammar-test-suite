-- =============================================================
-- Case ID: TC_INSTANTIATION_LIST_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INSTANTIATION_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: instantiation_list ::= instantiation_label { , instantiation_label } | others | all
-- Case Type: Positive
-- Test Focus: instantiation_list with 'others' and 'all' — tests the 'others' and 'all' reserved word alternatives in a compound_configuration_specification context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity il_others_all_ent is
  port(clk : in bit; d : in bit; q0 : out bit; q1 : out bit; q2 : out bit);
end entity;

architecture bh of il_others_all_ent is
  component dff is
    port(clk : in bit; d : in bit; q : out bit);
  end component;
  for others : dff
    use entity work.il_others_all_ent(bh)
    port map(clk => clk, d => d, q0 => open, q1 => open, q2 => open);
  signal r0, r1, r2 : bit := '0';
begin
  u0 : dff port map(clk=>clk, d=>d, q=>r0);
  u1 : dff port map(clk=>clk, d=>d, q=>r1);
  u2 : dff port map(clk=>clk, d=>d, q=>r2);
  q0 <= r0; q1 <= r1; q2 <= r2;
end architecture bh;
