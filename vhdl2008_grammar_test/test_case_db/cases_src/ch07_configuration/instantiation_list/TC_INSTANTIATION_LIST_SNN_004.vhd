-- =============================================================
-- Case ID: TC_INSTANTIATION_LIST_SNN_004
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_INSTANTIATION_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: instantiation_list ::= instantiation_label { , instantiation_label } | others | all
-- Case Type: Negative
-- Test Focus: Space-separated instantiation labels instead of comma-separated -- the BNF requires commas between instantiation_label items in the list; using bare whitespace as separator ("u_a u_b : comp") violates the grammar
-- Expected Result: Triggers syntax error (missing comma between labels)
-- Dependencies: None
-- =============================================================
entity il_snn4_no_comma is
  port(r : out bit);
end entity;

architecture bh of il_snn4_no_comma is
  component c_buf is
    port(a : in bit; y : out bit);
  end component;

  -- ERROR: space between labels instead of comma
  for u_a u_b : c_buf
    use entity work.il_snn4_no_comma(bh)
    port map(a => '0', y => r);

  signal s1, s2 : bit := '0';
begin
  u_a : c_buf port map(a => '0', y => s1);
  u_b : c_buf port map(a => '0', y => s2);
  r <= s1 or s2;
end architecture bh;
