-- =============================================================
-- Case ID: TC_INSTANTIATION_LIST_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_INSTANTIATION_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: instantiation_list ::= instantiation_label { , instantiation_label } | others | all
-- Case Type: Positive
-- Test Focus: instantiation_list with multiple labels — comma-separated list of instantiation labels in a component_specification, testing the { , instantiation_label } repetition form
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity il_multi_ent is
  port(din : in bit; dout0 : out bit; dout1 : out bit; dout2 : out bit);
end entity;

architecture bh of il_multi_ent is
  component buf is
    port(a : in bit; y : out bit);
  end component;
  for u_buf0, u_buf1, u_buf2 : buf
    use entity work.il_multi_ent(bh)
    port map(din => din, dout0 => open, dout1 => open, dout2 => open);
  signal s0, s1, s2 : bit := '0';
begin
  u_buf0 : buf port map(a=>din, y=>s0);
  u_buf1 : buf port map(a=>din, y=>s1);
  u_buf2 : buf port map(a=>din, y=>s2);
  dout0 <= s0; dout1 <= s1; dout2 <= s2;
end architecture bh;
